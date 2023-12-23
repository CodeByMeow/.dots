local opt = vim.opt -- for conciseness

-- line number
opt.nu = true
opt.relativenumber = true

-- tab & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true
opt.mouse = ""

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true

-- appearance
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.winblend = 0
opt.background = "dark"
opt.colorcolumn = "80"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

opt.updatetime = 50

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- disable nvim intro
opt.shortmess:append("sI")

-- slit windows
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

opt.timeoutlen = 400
opt.iskeyword:append("-")
-- number of item show popup menu
opt.ph = 7

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Cs = "\e[4:0m"]])

opt.ruler = false
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3

-- disable EditorConfig
vim.g.editorconfig = false

--showcmdloc
opt.cmdheight = 1
opt.showcmdloc = "statusline"

opt.laststatus = 2
opt.showtabline = 2

vim.g.netrw_browsex_viewer = "xdg-open"
