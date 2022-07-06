local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if status_ok then
  lsp_installer.settings({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  })

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { "tsserver", "sumneko_lua", "cssls", "html", "emmet_ls", "intelephense" }
  lsp_installer.setup({
    ensure_installed = servers
  })

  local lspconfig = require('lspconfig')
  local _, aerial = pcall('require', "aerial")
  local opts = {
    capabilities = capabilities,
    on_attach = aerial.on_attach
  }

  for _, server in pairs(servers) do
    if server == 'sumneko_lua' then
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'katvim',
            }
          }
        }
      }
    end
    lspconfig[server].setup(opts)
  end


end
