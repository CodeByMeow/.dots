local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Colemak Keybindings {{{
----------------------
map('n', 'n', 'j', opts)
map('x', 'n', 'j', opts)
map('o', 'n', 'j', opts)
map('n', 'e', 'k', opts)
map('x', 'e', 'k', opts)
map('o', 'e', 'k', opts)
map('n', 'i', 'l', opts)
map('x', 'i', 'l', opts)
map('o', 'i', 'l', opts)

-- Colemak Insert
map('n', 'u', 'i', opts)
map('n', 'U', 'I', opts)
map('x', 'u', 'i', opts)
map('x', 'U', 'I', opts)
map('o', 'u', 'i', opts)
map('o', 'U', 'I', opts)

-- Undo/redo
map('n', 'l', 'u', opts)
map('x', 'l', ':<C-U>undo<CR>', opts)
map('n', 'gl', 'u', opts)
map('x', 'gl', ':<C-U>undo<CR>', opts)

-- }}}

local keymap = vim.keymap

vim.g.mapleader = " "

-- Do not yank with x
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>w", "<cmd>:w<cr>")
keymap.set("n", "<leader>q", "<cmd>:q<cr>")
keymap.set("n", "<leader>x", "<cmd>:bdelete<cr>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwords
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move window
keymap.set("n", "<leader><leader>", "<C-w>w")

keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sn", "<C-w>j")
keymap.set("n", "se", "<C-w>k")
keymap.set("n", "si", "<C-w>l")

keymap.set("n", "<A-n>", ":m .+1<CR>")
keymap.set("n", "<A-e>", ":m .-2<CR>")
keymap.set("i", "<A-n>", "<ESC>:m .+1<CR>==gi")
keymap.set("i", "<A-e>", "<ESC>:m .-2<CR>==gi")
keymap.set("v", "<A-n>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-e>", ":m '<-2<CR>gv=gv")

-- Escape highlight search
keymap.set("n", "<ESC>", "<cmd>:noh<cr>", { noremap = true, silent = true })

keymap.set("n", "m", "nzzzv")
keymap.set("n", "M", "Nzzzv")

keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("c", "<C-e>", "<C-p>")
