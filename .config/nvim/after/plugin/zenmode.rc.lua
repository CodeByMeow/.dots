local status, zenmode = pcall(require, 'zen-mode')
if (not status) then return end
local nnoremap = require("katinbox.keymap").nnoremap

zenmode.setup()

nnoremap(';z', '<cmd>:ZenMode<cr>', { silent = true })
