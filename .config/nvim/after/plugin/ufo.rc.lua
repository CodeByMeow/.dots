local status, ufo = pcall(require, "ufo")
if (not status) then return end
local nnoremap = require("katinbox.keymap").nnoremap;

ufo.setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
}

nnoremap('zr', function()
    ufo.openAllFolds()
end)

nnoremap('zm', function()
    ufo.closeAllFolds()
end)
