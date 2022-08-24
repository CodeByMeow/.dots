local present, null_ls = pcall(require, "null-ls");
if not present then
  return
end

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end
local options = {
  sources = {
    formatting.prettier,
    formatting.black,
    formatting.gofmt,
    formatting.shfmt,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.dart_format,
    formatting.isort,
    formatting.codespell.with({ filetypes = { 'markdown' } }),
    formatting.stylua,
    completion.spell,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

null_ls.setup(options)
