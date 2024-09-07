return {
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("config.everforest")
        end,
    },

    { "rcarriga/nvim-notify" },

    {
        "neovim/nvim-lspconfig",
        cmd = "Mason",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("config.lsp")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("config.telescope")
        end,
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        keys = {
            { "tt", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        },
        dependencies = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        config = function()
            require("config.nvim-tree")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("config.lualine")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("config.treesitter")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            { "onsails/lspkind-nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            require("config.cmp")
        end,
    },

    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "ts", "<cmd>Outline<CR>", desc = "Toggle Symbol Outline" },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.which")
        end,
    },

    {
        "yorickpeterse/nvim-window",
        keys = {
            {
                "<leader>w",
                "<cmd>lua require('nvim-window').pick()<CR>",
                desc = "nvim-window Selection",
            },
        },
        config = function()
            require("config.nvim-window")
        end,
    },

    {
        "tpope/vim-fugitive",
        config = function()
            require("config.fugitive")
        end,
    },

    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                names = false,
                mode = "background",
            },
        },
    },

    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("config.mini-indentscope")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {
            disable_filetype = { "TelescopePrompt", "vim" },
        },
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            require("config.harpoon")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("config.conform")
        end,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    {
        "x48Jason/glance",
        opts = {
            gitee = {
                token = "~/.token.gitee",
                repo = "openeuler/kernel",
            },
            pathdiff = "diffonly",
            q_quit_log = "off",
        },
    },
    {
        "j-hui/fidget.nvim",
        config = true,
    },
    { "tpope/vim-sleuth" },
    {
        "anuvyklack/hydra.nvim",
        config = function()
            require("config.hydra")
        end,
    },
}
