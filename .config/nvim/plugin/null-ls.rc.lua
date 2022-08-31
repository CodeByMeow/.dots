local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics =  null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup {
  sources = {
    formatting.prettier,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.codespell.with({ filetypes = { 'markdown' } }),
    completion.spell,
    diagnostics.fish
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

vim.keymap.set('n', 'fm', '<cmd>lua vim.lsp.buf.format()<cr>', { noremap = true, silent = true })
