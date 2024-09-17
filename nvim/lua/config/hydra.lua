local Hydra = require("hydra")

Hydra({
    name = "Adjust Window Size",
    hint = false,
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = { border = "rounded" },
        on_enter = function()
            vim.o.virtualedit = "all"
        end,
    },
    mode = "n",
    body = "ca",
    heads = {
        { "k", "5<C-w>+" },
        { "j", "5<C-w>-", { desc = "j/k height" } },
        { "h", "5<C-w>>" },
        { "l", "5<C-w><", { desc = " h/l width" } },
        { "<Esc>", nil, { exit = true } },
        { "<CR>", nil, { exit = true } },
    },
})
