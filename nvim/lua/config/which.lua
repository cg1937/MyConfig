local wk = require("which-key")

wk.setup({})

wk.add({
    { "<leader>c", icon = "  ", group = "Copy" },
    { "<leader>cl", desc = "Copy Cursor Location" },

    { "<leader>b", icon = " ", group = "Buffer" },
    {
        "<leader>ba",
        desc = "Close all but the current buffer",
    },
    { "<leader>bb", desc = "Select the first visible buffer" },
    { "<leader>be", desc = "Select the last visible buffer" },
    {
        "<leader>bl",
        desc = "Close all buffers to the left",
    },
    { "<leader>bn", desc = "Move buffer next" },
    { "<leader>bp", desc = "Move buffer prev" },
    {
        "<leader>br",
        desc = "Close all BufferLines to the right",
    },
    { "<leader>bs", desc = "Pick buffer" },
    { "<leader>bw", "<cmd>w<cr>", desc = "Save Buffer" },
    { "<leader>b1", desc = "Buffer 1" },
    { "<leader>b2", desc = "Buffer 2" },
    { "<leader>b3", desc = "Buffer 3" },
    { "<leader>b4", desc = "Buffer 4" },
    { "<leader>b5", desc = "Buffer 5" },
    { "<leader>b6", desc = "Buffer 6" },
    { "<leader>b7", desc = "Buffer 7" },
    { "<leader>b8", desc = "Buffer 8" },
    { "<leader>b9", desc = "Buffer 9" },

    { "<leader>f", icon = "󰈞 ", group = "Find" },
    { "<leader>fb", desc = "Find buffer" },
    { "<leader>fd", desc = "Find LSP dynamic workspace symbols" },
    { "<leader>ff", desc = "Find file" },
    { "<leader>fg", desc = "Grep string" },
    { "<leader>fk", desc = "Find LSP references" },
    {
        "<leader>fl",
        desc = "Fuzzy serach from `git ls-files`(respects .gitignore)",
    },
    { "<leader>fo", desc = "List recent opened files" },
    { "<leader>fr", mode = "v", desc = "Git bcommits range" },
    { "<leader>fs", desc = "Live grep" },

    { "<leader>g", group = "Git" },
    {
        "<leader>gC",
        "<cmd>Telescope git_bcommits<cr>",
        desc = "Checkout commit(for current file)",
    },
    {
        "<leader>gb",
        "<cmd>Telescope git_branches<cr>",
        desc = "Checkout branch",
    },
    {
        "<leader>gc",
        "<cmd>Telescope git_commits<cr>",
        desc = "Checkout commit",
    },
    {
        "<leader>gg",
        "<cmd>Telescope git_status<cr>",
        desc = "Open changed file",
    },

    { "<leader>h", icon = " ", group = "Gitsigns" },
    { "<leader>hb", desc = "Blame line" },
    { "<leader>hc", desc = "Toggle current line blame" },
    { "<leader>hd", desc = "Diff this" },
    { "<leader>hD", desc = "Diff this ~" },
    { "<leader>hp", desc = "preview_hunk" },
    { "<leader>hr", desc = "Reset hunk" },
    { "<leader>hr", mode = "v", desc = "Reset hunk(VISUAL)" },
    { "<leader>hR", desc = "Reset buffer" },
    { "<leader>hs", desc = "Stage hunk" },
    { "<leader>hs", mode = "v", desc = "Stage hunk(VISUAL)" },
    { "<leader>hS", desc = "Stage buffer" },
    { "<leader>hu", desc = "Undo stage hunk" },
    { "<leader>hx", desc = "Toggle deleted" },

    { "<leader>l", group = "LSP" },
    {
        "<leader>lA",
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
        desc = "Add Workspace Folder",
    },
    {
        "<leader>lD",
        "<cmd>lua vim.lsp.buf.declaration()<cr>",
        desc = "Go To Declaration",
    },
    {
        "<leader>lI",
        "<cmd>lua vim.lsp.buf.implementation()<cr>",
        desc = "Show implementations",
    },
    {
        "<leader>lK",
        "<cmd>lua vim.lsp.buf.hover()<cr>",
        desc = "Hover Commands",
    },
    {
        "<leader>lL",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        desc = "List Workspace Folders",
    },
    { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    {
        "<leader>lS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
    },
    {
        "<leader>lW",
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
        desc = "Remove Workspace Folder",
    },
    {
        "<leader>la",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        desc = "Code Action",
    },
    {
        "<leader>ld",
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        desc = "Go To Definition",
    },
    {
        "<leader>le",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "Document Diagnostics",
    },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", desc = "Format" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Connected Language Servers" },
    {
        "<leader>lk",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        desc = "Signature Help",
    },
    {
        "<leader>ll",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Line diagnostics",
    },
    {
        "<leader>ln",
        "<cmd>lua vim.diagnostic.goto_next()<cr>",
        desc = "Next Diagnostic",
    },
    {
        "<leader>lp",
        "<cmd>lua vim.diagnostic.goto_prev()<cr>",
        desc = "Prev Diagnostic",
    },
    {
        "<leader>lq",
        "<cmd>lua vim.diagnostic.set_loclist()<cr>",
        desc = "Quickfix",
    },
    {
        "<leader>lr",
        "<cmd>Telescope lsp_references<cr>",
        desc = "Symbol References",
    },
    {
        "<leader>ls",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document Symbols",
    },
    {
        "<leader>lt",
        "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        desc = "Type Definition",
    },
    {
        "<leader>lw",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Workspace Diagnostics",
    },

    { "<leader>s", icon = " ", group = "Kit" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Search symbols" },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },

    { "<leader>z", icon = " ", group = "Spelling" },
    { "<leader>za", "zg", desc = "Add word" },
    { "<leader>zf", "1z=", desc = "Use 1. correction" },
    {
        "<leader>zl",
        "<cmd>Telescope spell_suggest<cr>",
        desc = "List corrections",
    },
    { "<leader>zn", "]s", desc = "Next" },
    { "<leader>zp", "[s", desc = "Previous" },
})
