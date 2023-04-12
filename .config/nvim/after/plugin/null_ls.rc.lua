local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup {
    sources = {
        formatting.prettier,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.codespell.with({ filetypes = { 'markdown' } }),
        completion.spell,
        diagnostics.fish,
    },
    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
        if vim.bo.filetype == "norg" then
            return;
        end
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup_format,
                buffer = 0,
                callback = function()
                    vim.lsp.buf.format({ timeout_ms = 2000 })
                end
            })
        end
    end,
}

vim.keymap.set('n', 'fm', '<cmd>lua vim.lsp.buf.format()<cr>', { noremap = true, silent = true })
