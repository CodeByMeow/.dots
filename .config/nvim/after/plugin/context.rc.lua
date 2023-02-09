local status, context = pcall(require, 'treesitter-context')
if (not status) then return end

context.setup()
