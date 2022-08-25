local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
  return
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "tsserver", "sumneko_lua", "cssls", "html", "emmet_ls", "intelephense" }
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig = require('lspconfig')
local opts = {
  capabilities = capabilities,
}

for _, server in pairs(servers) do
  if server == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
          }
        }
      }
    }
  end
  lspconfig[server].setup(opts)
end
