local status, zenmode = pcall(require, 'zen-mode')
if (not status) then return end

zenmode.setup()

vim.keymap.set('n', ';z', '<cmd>:ZenMode<cr>', { noremap = true, silent = true })
