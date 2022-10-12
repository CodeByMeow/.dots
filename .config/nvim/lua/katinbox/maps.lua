local nnoremap = require("katinbox.keymap").nnoremap
local inoremap = require("katinbox.keymap").inoremap
local vnoremap = require("katinbox.keymap").vnoremap
local nmap = require("katinbox.keymap").nmap

-- Do not yank with x
nnoremap('x', '"_x')

-- Increment/decrement
nnoremap('+', '<C-a>')
nnoremap('-', '<C-x>')

-- Delete a word backwords
nnoremap('dw', 'vb"_d')

-- Select all
nnoremap('<C-a>', 'gg<S-v>G')

-- New tab
nnoremap('te', ':tabedit<Return>')

-- Split window
nnoremap('ss', ':split<Return><C-w>w', { silent = true })
nnoremap('sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
nmap('<Space>', '<C-w>w')
nmap('sh', '<C-w>h')
nmap('sj', '<C-w>j')
nmap('sk', '<C-w>k')
nmap('sl', '<C-w>l')

-- Resize window
nnoremap('<C-w><left>', '<C-w><')
nnoremap('<C-w><right>', '<C-w>>')
nnoremap('<C-w><up>', '<C-w>+')
nnoremap('<C-w><down>', '<C-w>-')

-- Move around
inoremap('<C-h>', '<left>')
inoremap('<C-j>', '<down>')
inoremap('<C-k>', '<up>')
inoremap('<C-l>', '<right>')

nnoremap('<A-j>', ':m .+1<CR>')
nnoremap('<A-k>', ':m .-2<CR>')
inoremap('<A-k>', '<ESC>:m .-2<CR>==gi')
inoremap('<A-j>', '<ESC>:m .+1<CR>==gi')
vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
vnoremap('<A-k>', ":m '<-2<CR>gv=gv")

-- Close current buffer
nnoremap('<Space>x', '<cmd>:bd<cr>')
