local status, ufo = pcall(require, "ufo")
if (not status) then return end

ufo.setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
}

vim.keymap.set('n', 'zr', function()
    ufo.openAllFolds()
end, { noremap = true, silent = true })

vim.keymap.set('n', 'zm', function()
    ufo.closeAllFolds()
end, { noremap = true, silent = true })
