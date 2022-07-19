local present, lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
   return
end

local options = {
   -- ensure_installed is not needed as automatic_installation is enabled
   -- then any lsp server you setup by lspconfig is going to get installed automatically!

   -- ensure_installed = { "lua" },
   automatic_installation = true,

   ui = {
      icons = {
         server_installed = " ",
         server_pending = " ",
         server_uninstalled = " ﮊ",
      },
      keymaps = {
         toggle_server_expand = "<CR>",
         install_server = "i",
         update_server = "u",
         check_server_version = "c",
         update_all_servers = "U",
         check_outdated_servers = "C",
         uninstall_server = "X",
      },
   },

   max_concurrent_installers = 10,
}

lsp_installer.settings(options)
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { "tsserver", "sumneko_lua", "cssls", "html", "emmet_ls", "intelephense" }
  lsp_installer.setup({
    ensure_installed = servers
  })

  local lspconfig = require('lspconfig')
  local _, aerial = pcall(require, "aerial")
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


