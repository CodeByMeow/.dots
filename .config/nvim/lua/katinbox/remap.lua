local keymap = vim.keymap

vim.g.mapleader = " "
-- Do not yank with x
keymap.set('n', 'x', '"_x')
keymap.set('n', '<leader>w', '<cmd>:w<cr>')
keymap.set('n', '<leader>q', '<cmd>:q<cr>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwords
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')

keymap.set('', 'sm', '<C-w>h')
keymap.set('', 'sn', '<C-w>j')
keymap.set('', 'se', '<C-w>k')
keymap.set('', 'si', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Move around
keymap.set('i', '<C-m>', '<left>')
keymap.set('i', '<C-n>', '<down>')
keymap.set('i', '<C-e>', '<up>')
keymap.set('i', '<C-i>', '<right>')

keymap.set('n', '<A-n>', ':m .+1<CR>')
keymap.set('n', '<A-e>', ':m .-2<CR>')
keymap.set('i', '<A-n>', '<ESC>:m .+1<CR>==gi')
keymap.set('i', '<A-e>', '<ESC>:m .-2<CR>==gi')
keymap.set('v', '<A-n>', ":m '>+1<CR>gv=gv")
keymap.set('v', '<A-e>', ":m '<-2<CR>gv=gv")

-- Escape highlight search
keymap.set('n', '<ESC>', '<cmd>:noh<cr>', { noremap = true, silent = true })

vim.keymap.set("n", "h", "nzzzv")
vim.keymap.set("n", "k", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
