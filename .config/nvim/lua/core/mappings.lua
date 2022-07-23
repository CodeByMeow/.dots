local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map('i', '<C-h>', '<left>', opts)
map('i', '<C-l>', '<right>', opts)
map('i', '<C-k>', '<up>', opts)
map('i', '<C-j>', '<down>', opts)

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map('n', '<A-j>', ':m .+1<CR>', opts)
map('n', '<A-k>', ':m .-2<CR>', opts)
map('i', '<A-k>', '<ESC>:m .-2<CR>==gi', opts)
map('i', '<A-j>', '<ESC>:m .+1<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

map('n', '<ESC>', ':noh<cr>', opts)

--Quick delete word on insert mode
map("i", "<C-w>", "<C-O>diw", opts)

