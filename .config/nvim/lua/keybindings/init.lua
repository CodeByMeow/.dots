vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }
map('n', '<C-left>', '<C-w>h', opts)
map('n', '<C-right>', '<C-w>l', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-j>', '<C-w>j', opts)

map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)

map('n', '<A-j>', ':m .+1<CR>', opts)
map('n', '<A-k>', ':m .-2<CR>', opts)
map('i', '<A-k>', '<ESC>:m .-2<CR>==gi', opts)
map('i', '<A-j>', '<ESC>:m .+1<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

map('n', '<ESC>', ':noh<cr>', opts)

--Quick delete word on insert mode
map("i", "<C-w>", "<C-O>diw", opts)
