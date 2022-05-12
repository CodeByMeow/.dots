---@diagnostic disable: undefined-global
vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.wo.wrap = false
vim.wo.number = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.opt.laststatus = 3

local set_nornu = {
  pattern = "*",
  callback = function()
    vim.wo.rnu = false
  end
}

local set_rnu = {
  pattern = "*",
  callback = function()
    vim.wo.rnu = true
  end
}

local autocmd = vim.api.nvim_create_autocmd

autocmd("InsertEnter", set_nornu)
autocmd("BufLeave", set_nornu)
autocmd("FocusLost", set_nornu)
autocmd("WinLeave", set_nornu)

autocmd("BufEnter", set_rnu)
autocmd("FocusGained", set_rnu)
autocmd("InsertLeave", set_rnu)
autocmd("WinEnter", set_rnu)
