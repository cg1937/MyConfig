local default_options = { noremap = true, silent = true }
require("nvim-window").setup({
    -- The characters available for hinting windows.
    chars = {
        "f",
        "j",
        "d",
        "k",
        "s",
        "l",
        "a",
        ";",
        "c",
        "m",
        "r",
        "u",
        "e",
        "i",
        "w",
        "o",
        "q",
        "p",
    },

    -- A group to use for overwriting the Normal highlight group in the floating
    -- window. This can be used to change the background color.
    normal_hl = "Normal",

    -- The highlight group to apply to the line that contains the hint characters.
    -- This is used to make them stand out more.
    hint_hl = "Bold",

    -- The border style to use for the floating window.
    border = {
        "▛",
        "▀",
        "▜",
        "▐",
        "▟",
        "▄",
        "▙",
        "▌",
    },
})

vim.keymap.set(
    "n",
    "<leader>w",
    "<cmd>lua require('nvim-window').pick()<CR>",
    default_options
)
