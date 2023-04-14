require('icon-picker').setup {}
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>i", "<cmd>PickIcons<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>PickIconsYank<cr>", opts) --> Yank the selected icon into register
