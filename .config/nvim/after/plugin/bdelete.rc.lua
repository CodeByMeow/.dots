local status, _ = pcall(require, 'bufdelete')
if (not status) then return end

vim.keymap.set('n', '<space>x', '<cmd>:Bdelete<cr>')
