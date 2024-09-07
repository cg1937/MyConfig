local opt = vim.opt
local o = vim.o

opt.background = "dark"

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.wrap = true
opt.number = true
opt.signcolumn = "yes:1"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.relativenumber = true

opt.termguicolors = true

o.list = true
opt.listchars:append("eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣")

opt.wildignore = { "*.o", "*.cmd", "*~", "*.pyc" }
opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldmethod()"
opt.foldtext = ""
opt.foldnestmax = 3
opt.foldlevel = 99
opt.foldlevelstart = 99

o.colorcolumn = "80"
o.tabstop = 4
o.expandtab = true
o.shiftwidth = 4
