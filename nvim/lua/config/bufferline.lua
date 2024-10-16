local default_options = { noremap = true, silent = true }

local function file_name()
	return vim.fn.expand('%')
end

require('bufferline').setup({
	options = {
		offsets = {
			{
				filetype = 'NvimTree',
				text = '',
				highlight = 'Directory',
				separator = true,
			},
			{
				filetype = 'Outline',
				highlight = 'BufferlineCustomeNvimtree',
				text = '  [' .. file_name() .. '] Symbols Outline',
				text_align = 'left',
				separator = true,
			},
		},
	},
})

vim.keymap.set(
	'n',
	'<leader>ba',
	'<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>bb',
	"<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
	default_options
)
vim.keymap.set(
	'n',
	'<leader>be',
	"<cmd>:lua require'bufferline'.move_to(1)<cr>",
	default_options
)
vim.keymap.set(
	'n',
	'<leader>bd',
	"<cmd>:lua require'bufferline'.move_to(-1)<cr>",
	default_options
)
vim.keymap.set('n', '<leader>bf', '<cmd>BufferLinePick<cr>', default_options)
vim.keymap.set(
	'n',
	'<leader>bl',
	'<cmd>BufferLineCloseLeft<cr>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>bn',
	'<cmd>BufferLineCycleNext<cr>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>bp',
	'<cmd>BufferLineCyclePrev<cr>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>br',
	'<cmd>BufferLineCloseRight<cr>',
	default_options
)

vim.keymap.set(
	'n',
	'<leader>1',
	'<Cmd>BufferLineGoToBuffer 1<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>2',
	'<Cmd>BufferLineGoToBuffer 2<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>3',
	'<Cmd>BufferLineGoToBuffer 3<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>4',
	'<Cmd>BufferLineGoToBuffer 4<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>5',
	'<Cmd>BufferLineGoToBuffer 5<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>6',
	'<Cmd>BufferLineGoToBuffer 6<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>7',
	'<Cmd>BufferLineGoToBuffer 7<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>8',
	'<Cmd>BufferLineGoToBuffer 8<CR>',
	default_options
)
vim.keymap.set(
	'n',
	'<leader>9',
	'<Cmd>BufferLineGoToBuffer 9<CR>',
	default_options
)
