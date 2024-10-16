local telescope = require('telescope')
local actions = require('telescope.actions')
local TSLayout = require('telescope.pickers.layout')
local default_options = { noremap = true, silent = true }
local Layout = require('nui.layout')
local Popup = require('nui.popup')

local function make_popup(options)
	local popup = Popup(options)
	function popup.border:change_title(title)
		popup.border.set_text(popup.border, 'top', title)
	end
	return TSLayout.Window(popup)
end

local function my_scroll_preview_page(prompt_bufnr, direction)
	local status = require('telescope.state').get_status(prompt_bufnr)
	status.picker.layout_config.scroll_speed =
		vim.api.nvim_win_get_height(status.preview_win)
	require('telescope.actions.set').scroll_previewer(prompt_bufnr, direction)
	status.picker.layout_config.scroll_speed = 1
end

local function my_get_status_text(self, opts)
	local ww = #(self:get_multi_selection())
	local xx = (self.stats.processed or 0) - (self.stats.filtered or 0)
	local yy = self.stats.processed or 0
	local status_icon = ''
	if opts and not opts.completed then
		status_icon = '*'
	end
	if xx == 0 and yy == 0 then
		return status_icon
	end
	local row = xx - (self.max_results - self:get_selection_row()) + 1
	if ww == 0 then
		return string.format('%s %s / %s / %s', status_icon, row, xx, yy)
	else
		return string.format(
			'%s %s / %s / %s / %s',
			status_icon,
			ww,
			row,
			xx,
			yy
		)
	end
end

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		workspaces = {
			-- keep insert mode after selection in the picker, default is false
			keep_insert = true,
		},
	},
	defaults = {
		get_status_text = my_get_status_text,
		layout_strategy = 'flex',
		layout_config = {
			horizontal = {
				size = {

					width = '90%',
					height = '60%',
				},
			},
			vertical = {
				size = {
					width = '90%',
					height = '90%',
				},
			},
		},
		create_layout = function(picker)
			local border = {
				results = {

					top_left = '┌',
					top = '─',

					top_right = '┬',

					right = '│',
					bottom_right = '',
					bottom = '',

					bottom_left = '',
					left = '│',
				},
				results_patch = {
					minimal = {

						top_left = '┌',
						top_right = '┐',
					},
					horizontal = {
						top_left = '┌',

						top_right = '┬',
					},
					vertical = {
						top_left = '├',
						top_right = '┤',
					},
				},
				prompt = {
					top_left = '├',
					top = '─',
					top_right = '┤',
					right = '│',
					bottom_right = '┘',
					bottom = '─',
					bottom_left = '└',
					left = '│',
				},
				prompt_patch = {
					minimal = {
						bottom_right = '┘',
					},
					horizontal = {
						bottom_right = '┴',
					},
					vertical = {
						bottom_right = '┘',
					},
				},

				preview = {
					top_left = '┌',
					top = '─',
					top_right = '┐',
					right = '│',
					bottom_right = '┘',
					bottom = '─',
					bottom_left = '└',
					left = '│',
				},
				preview_patch = {
					minimal = {},
					horizontal = {
						bottom = '─',
						bottom_left = '',
						bottom_right = '┘',
						left = '',
						top_left = '',
					},
					vertical = {
						bottom = '',
						bottom_left = '',
						bottom_right = '',

						left = '│',
						top_left = '┌',
					},
				},
			}

			local results = make_popup({
				focusable = false,
				border = {
					style = border.results,
					text = {
						top = picker.results_title,
						top_align = 'center',
					},
				},
				win_options = {
					winhighlight = 'Normal:Normal',
				},
			})

			local prompt = make_popup({

				enter = true,

				border = {
					style = border.prompt,
					text = {
						top = picker.prompt_title,
						top_align = 'center',
					},
				},
				win_options = {
					winhighlight = 'Normal:Normal',
				},
			})

			local preview = make_popup({
				focusable = false,
				border = {
					style = border.preview,

					text = {
						top = picker.preview_title,
						top_align = 'center',
					},
				},
			})

			local box_by_kind = {
				vertical = Layout.Box({
					Layout.Box(preview, { grow = 1 }),
					Layout.Box(results, { grow = 1 }),
					Layout.Box(prompt, { size = 3 }),
				}, { dir = 'col' }),

				horizontal = Layout.Box({

					Layout.Box({
						Layout.Box(results, { grow = 1 }),
						Layout.Box(prompt, { size = 3 }),
					}, { dir = 'col', size = '50%' }),
					Layout.Box(preview, { size = '50%' }),
				}, { dir = 'row' }),
				minimal = Layout.Box({

					Layout.Box(results, { grow = 1 }),
					Layout.Box(prompt, { size = 3 }),
				}, { dir = 'col' }),
			}

			local function get_box()
				local strategy = picker.layout_strategy
				if strategy == 'vertical' or strategy == 'horizontal' then
					return box_by_kind[strategy], strategy
				end

				local height, width = vim.o.lines, vim.o.columns
				local box_kind = 'horizontal'

				if width < 100 then
					box_kind = 'vertical'
					if height < 40 then
						box_kind = 'minimal'
					end
				end
				return box_by_kind[box_kind], box_kind
			end

			local function prepare_layout_parts(layout, box_type)
				layout.results = results
				results.border:set_style(border.results_patch[box_type])

				layout.prompt = prompt

				prompt.border:set_style(border.prompt_patch[box_type])

				if box_type == 'minimal' then
					layout.preview = nil
				else
					layout.preview = preview
					preview.border:set_style(border.preview_patch[box_type])
				end
			end

			local function get_layout_size(box_kind)
				return picker.layout_config[box_kind == 'minimal' and 'vertical' or box_kind].size
			end

			local box, box_kind = get_box()
			local layout = Layout({
				relative = 'editor',
				position = '50%',
				size = get_layout_size(box_kind),
			}, box)

			layout.picker = picker
			prepare_layout_parts(layout, box_kind)

			local layout_update = layout.update
			function layout:update()
				local box, box_kind = get_box()
				prepare_layout_parts(layout, box_kind)
				layout_update(self, { size = get_layout_size(box_kind) }, box)
			end

			return TSLayout(layout)
		end,
		file_ignore_patterns = {
			'.cache/',
			'%.o',
			'%.so',
			'%.a',
			'%.ko',
			'%.tar.gz',
			'%.o.cmd',
		},
		mappings = {
			i = {
				['<c-k>'] = require('telescope.actions').preview_scrolling_up,
				['<c-j>'] = require('telescope.actions').preview_scrolling_down,
				['<c-u>'] = false,
				['<c-e>'] = function(prompt_bufnr)
					actions.select_default(prompt_bufnr)
					require('telescope.builtin').resume()
				end,
				['<tab>'] = actions.toggle_selection
					+ actions.move_selection_next,
				['<C-tab>'] = actions.toggle_selection
					+ actions.move_selection_previous,
			},
			n = {
				['<c-k>'] = require('telescope.actions').preview_scrolling_up,
				['<c-j>'] = require('telescope.actions').preview_scrolling_down,
				['<u>'] = function(prompt_bufnr)
					my_scroll_preview_page(prompt_bufnr, -1)
				end,
				['<d>'] = function(prompt_bufnr)
					my_scroll_preview_page(prompt_bufnr, 1)
				end,
				['<c-e>'] = function(prompt_bufnr)
					actions.select_default(prompt_bufnr)
					require('telescope.builtin').resume()
				end,
				['<tab>'] = actions.toggle_selection
					+ actions.move_selection_next,
				['<C-tab>'] = actions.toggle_selection
					+ actions.move_selection_previous,
			},
		},
	},
})

telescope.load_extension('fzf')

local function my_lsp_dynamic_workspace_symbols(user_opts)
	local opts = user_opts or {}
	local width = vim.api.nvim_win_get_width(0) / 4
	local tag_item = {
		tagname = vim.fn.expand('<cword>'),
		from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 },
		winid = vim.fn.win_getid(),
	}

	opts.fname_width = width < 50 and 50 or width
	opts.attach_mappings = function(_, map)
		map('i', '<c-g>', actions.to_fuzzy_refine)
		map({ 'i', 'n' }, '<CR>', function(prompt_bufnr)
			vim.fn.settagstack(tag_item.winid, { items = { tag_item } }, 't')
			actions.select_default(prompt_bufnr)
			vim.cmd.normal('zz')
		end)
		return true
	end
	require('telescope.builtin').lsp_dynamic_workspace_symbols(opts)
end

local function my_lsp_references()
	local opts = { temp__scrolling_limit = 1000 }
	local width = vim.api.nvim_win_get_width(0) / 4

	opts.jump_type = 'never'
	opts.fname_width = width < 50 and 50 or width
	opts.include_current_line = true
	require('telescope.builtin').lsp_references(opts)
end

local function my_live_grep()
	local opts = { temp__scrolling_limit = 1000 }
	vim.fn.systemlist('git rev-parse --is-inside-work-tree')
	if vim.v.shell_error == 0 then
		opts.cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
	end
	opts.attach_mappings = function(_, map)
		map('i', '<c-g>', actions.to_fuzzy_refine)
		return true
	end
	require('telescope.builtin').live_grep(opts)
end

vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', default_options)
vim.keymap.set(
	'n',
	'<leader>fd',
	my_lsp_dynamic_workspace_symbols,
	default_options
)
vim.keymap.set(
	'n',
	'<leader>ff',
	"<cmd>lua require'telescope.builtin'.find_files({\z
     find_command = { 'fd', '-HIL', '-j', '25'}\z
     })<cr>",
	default_options
)
vim.keymap.set(
	'n',
	'<leader>fg',
	'<cmd>Telescope grep_string<CR>',
	default_options
)
vim.keymap.set('n', '<leader>fk', my_lsp_references, default_options)
vim.keymap.set(
	'n',
	'<leader>fl',
	'<cmd>Telescope git_files<cr>',
	default_options
)
vim.keymap.set(
	'v',
	'<leader>fr',
	'<cmd>Telescope git_bcommits_range<CR>',
	default_options
)
vim.keymap.set('n', '<leader>fs', my_live_grep, default_options)
vim.keymap.set(
	'n',
	'<leader>fo',
	'<cmd>Telescope oldfiles<cr>',
	default_options
)
