require("notify").setup({
    fps = 60,
    icons = {
        DEBUG = "  ",
        ERROR = "  ",
        INFO = "  ",
        TRACE = " ",
        WARN = "  ",
    },
    stage = "slide",
})

vim.notify = require("notify")
