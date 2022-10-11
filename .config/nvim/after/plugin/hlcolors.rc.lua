local status, hlcolors = pcall(require, 'nvim-highlight-colors')
if (not status) then return end

hlcolors.setup()

