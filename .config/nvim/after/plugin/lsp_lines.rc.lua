require("lsp_lines").setup()
vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        local floating = vim.api.nvim_win_get_config(0).relative ~= ""
        vim.diagnostic.config({
            virtual_text = floating,
            virtual_lines = not floating,
        })
    end,
})
