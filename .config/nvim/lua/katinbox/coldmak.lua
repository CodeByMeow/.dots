local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Colemak Keybindings {{{
----------------------
map('n', 'm', 'h', opts)
map('x', 'm', 'h', opts)
map('o', 'm', 'h', opts)
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
