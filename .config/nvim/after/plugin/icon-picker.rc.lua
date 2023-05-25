require('icon-picker').setup {}
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>y", "<cmd>PickEverythingYank<cr>", opts) --> Yank the selected icon into register
