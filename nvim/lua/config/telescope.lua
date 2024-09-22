local telescope = require("telescope")
local actions = require("telescope.actions")
local default_options = { noremap = true, silent = true }

local function my_scroll_preview_page(prompt_bufnr, direction)
    local status = require("telescope.state").get_status(prompt_bufnr)
    status.picker.layout_config.scroll_speed =
        vim.api.nvim_win_get_height(status.preview_win)
    require("telescope.actions.set").scroll_previewer(prompt_bufnr, direction)
    status.picker.layout_config.scroll_speed = 1
end

local function my_get_status_text(self, opts)
    local ww = #(self:get_multi_selection())
    local xx = (self.stats.processed or 0) - (self.stats.filtered or 0)
    local yy = self.stats.processed or 0
    local status_icon = ""
    if opts and not opts.completed then
        status_icon = "*"
    end
    if xx == 0 and yy == 0 then
        return status_icon
    end
    local row = xx - (self.max_results - self:get_selection_row()) + 1
    if ww == 0 then
        return string.format("%s %s / %s / %s", status_icon, row, xx, yy)
    else
        return string.format(
            "%s %s / %s / %s / %s",
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
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        workspaces = {
            -- keep insert mode after selection in the picker, default is false
            keep_insert = true,
        },
    },
    defaults = {
        get_status_text = my_get_status_text,
        layout_strategy = "horizontal",
        layout_config = {
            vertical = {
                height = 0.9,
                preview_cutoff = 0,
                width = 0.9,
            },
        },
        file_ignore_patterns = {
            ".cache/",
            "%.o",
            "%.so",
            "%.a",
            "%.ko",
            "%.tar.gz",
            "%.o.cmd",
        },
        mappings = {
            i = {
                ["<c-k>"] = require("telescope.actions").preview_scrolling_up,
                ["<c-j>"] = require("telescope.actions").preview_scrolling_down,
                ["<c-u>"] = false,
                ["<c-e>"] = function(prompt_bufnr)
                    actions.select_default(prompt_bufnr)
                    require("telescope.builtin").resume()
                end,
                ["<tab>"] = actions.toggle_selection
                    + actions.move_selection_next,
                ["<C-tab>"] = actions.toggle_selection
                    + actions.move_selection_previous,
            },
            n = {
                ["<c-k>"] = require("telescope.actions").preview_scrolling_up,
                ["<c-j>"] = require("telescope.actions").preview_scrolling_down,
                ["<u>"] = function(prompt_bufnr)
                    my_scroll_preview_page(prompt_bufnr, -1)
                end,
                ["<d>"] = function(prompt_bufnr)
                    my_scroll_preview_page(prompt_bufnr, 1)
                end,
                ["<c-e>"] = function(prompt_bufnr)
                    actions.select_default(prompt_bufnr)
                    require("telescope.builtin").resume()
                end,
                ["<tab>"] = actions.toggle_selection
                    + actions.move_selection_next,
                ["<C-tab>"] = actions.toggle_selection
                    + actions.move_selection_previous,
            },
        },
    },
})

telescope.load_extension("fzf")

local function my_lsp_dynamic_workspace_symbols(user_opts)
    local opts = user_opts or {}
    local width = vim.api.nvim_win_get_width(0) / 4
    local tag_item = {
        tagname = vim.fn.expand("<cword>"),
        from = { vim.fn.bufnr("%"), vim.fn.line("."), vim.fn.col("."), 0 },
        winid = vim.fn.win_getid(),
    }

    opts.fname_width = width < 50 and 50 or width
    opts.attach_mappings = function(_, map)
        map("i", "<c-g>", actions.to_fuzzy_refine)
        map({ "i", "n" }, "<CR>", function(prompt_bufnr)
            vim.fn.settagstack(tag_item.winid, { items = { tag_item } }, "t")
            actions.select_default(prompt_bufnr)
            vim.cmd.normal("zz")
        end)
        return true
    end
    require("telescope.builtin").lsp_dynamic_workspace_symbols(opts)
end

local function my_lsp_references()
    local opts = { temp__scrolling_limit = 1000 }
    local width = vim.api.nvim_win_get_width(0) / 4

    opts.jump_type = "never"
    opts.fname_width = width < 50 and 50 or width
    opts.include_current_line = true
    require("telescope.builtin").lsp_references(opts)
end

local function my_live_grep()
    local opts = { temp__scrolling_limit = 1000 }
    vim.fn.systemlist("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
        opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    end
    opts.attach_mappings = function(_, map)
        map("i", "<c-g>", actions.to_fuzzy_refine)
        return true
    end
    require("telescope.builtin").live_grep(opts)
end

vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", default_options)
vim.keymap.set(
    "n",
    "<leader>fd",
    my_lsp_dynamic_workspace_symbols,
    default_options
)
vim.keymap.set(
    "n",
    "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files({\z
     find_command = { 'fd', '--hidden', '--type', 'file', '--follow'}\z
     })<cr>",
    default_options
)
vim.keymap.set(
    "n",
    "<leader>fg",
    "<cmd>Telescope grep_string<CR>",
    default_options
)
vim.keymap.set("n", "<leader>fk", my_lsp_references, default_options)
vim.keymap.set(
    "n",
    "<leader>fl",
    "<cmd>Telescope git_files<cr>",
    default_options
)
vim.keymap.set(
    "v",
    "<leader>fr",
    "<cmd>Telescope git_bcommits_range<CR>",
    default_options
)
vim.keymap.set("n", "<leader>fs", my_live_grep, default_options)
vim.keymap.set(
    "n",
    "<leader>fo",
    "<cmd>Telescope oldfiles<cr>",
    default_options
)
