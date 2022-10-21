local status, ufo = pcall(require, "ufo")
if (not status) then return end
local nnoremap = require("katinbox.keymap").nnoremap;

ufo.setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
}

nnoremap('zR', function()
    ufo.openAllFolds()
end)

nnoremap('zM', function()
    ufo.closeAllFolds()
end)
