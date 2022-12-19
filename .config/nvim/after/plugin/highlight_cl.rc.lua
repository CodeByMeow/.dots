local status, hl_colors = pcall(require, 'nvim-highlight-colors')
if (not status) then return end

hl_colors.setup()
