local status, zenmode = pcall(require, 'zen-mode')
if (not status) then return end

zenmode.setup()
