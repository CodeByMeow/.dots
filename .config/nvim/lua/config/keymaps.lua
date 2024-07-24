local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- Colemak Keybindings {{{
----------------------
map("n", "n", "j", opts)
map("x", "n", "j", opts)
map("o", "n", "j", opts)
map("n", "e", "k", opts)
map("x", "e", "k", opts)
map("o", "e", "k", opts)
map("n", "i", "l", opts)
map("x", "i", "l", opts)
map("o", "i", "l", opts)

-- Colemak Insert
map("n", "u", "i", opts)
map("n", "U", "I", opts)
map("x", "u", "i", opts)
map("x", "U", "I", opts)
map("o", "u", "i", opts)
map("o", "U", "I", opts)

-- Undo/redo
map("n", "l", "u", opts)
map("x", "l", ":<C-U>undo<CR>", opts)
map("n", "gl", "u", opts)
map("x", "gl", ":<C-U>undo<CR>", opts)

-- }}}

-- Do not yank with x
map("n", "x", '"_x')

map("n", "<leader>w", "<cmd>:w<cr>", vim.tbl_extend("keep", opts, { desc = "Save" }))
map("n", "<leader>q", "<cmd>:q<cr>", vim.tbl_extend("keep", opts, { desc = "Quit" }))
map("n", "<leader>wq", "<cmd>:wqa<cr>", vim.tbl_extend("keep", opts, { desc = "Save all and quit" }))
map("n", "<leader>x", "<cmd>:bdelete<cr>", vim.tbl_extend("keep", opts, { desc = "Close buffer" }))

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Split window
map("n", "ss", ":split<Return><C-w>w", { silent = true })
map("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move window
map("n", "<leader><leader>", "<C-w>w")

map("n", "sh", "<C-w>h")
map("n", "sn", "<C-w>j")
map("n", "se", "<C-w>k")
map("n", "si", "<C-w>l")

map("n", "<A-n>", ":m .+1<CR>")
map("n", "<A-e>", ":m .-2<CR>")
map("i", "<A-n>", "<ESC>:m .+1<CR>==gi")
map("i", "<A-e>", "<ESC>:m .-2<CR>==gi")
map("v", "<A-n>", ":m '>+1<CR>gv=gv")
map("v", "<A-e>", ":m '<-2<CR>gv=gv")

-- Escape highlight search
map("n", "<ESC>", "<cmd>:noh<cr>", { noremap = true, silent = true })

map("n", "m", "nzzzv")
map("n", "M", "Nzzzv")

map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current text" })
map("c", "<C-e>", "<C-p>")

-- Switch tabs
map("n", "<Tab>", vim.cmd.bn)
map("n", "<S-Tab>", vim.cmd.bp)

map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

require("config.discipline").cowboy()
