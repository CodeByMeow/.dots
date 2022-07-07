local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.black,
    formatting.gofmt,
    formatting.shfmt,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.dart_format,
    --[[ formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line',
        '--no-break-after-operator',
        '--column-limit=100',
        '--break-after-table-lb',
        '--indent-width=2'
      }
    }), ]]
    formatting.isort,
    formatting.codespell.with({ filetypes = { 'markdown' } }),
    diagnostics.puglint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format()
        end,
      })
    end
  end
})
