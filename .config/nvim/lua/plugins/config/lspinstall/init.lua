---@diagnostic disable: undefined-global, lowercase-global
local lsp_installer = require("nvim-lsp-installer")
local coq = require("coq")
lsp_installer.on_server_ready(function(server)
    capabilities = vim.lsp.protocol.make_client_capabilities()
    local opts = {coq.lsp_ensure_capabilities({capabilities = capabilities})}
 server:setup(opts)
end)

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
--[[ -- setup coq.lua
require("packer").loader("coq_nvim coq.artifacts")
vim.g.coq_settings = {auto_start = true, clients = {tabnine = {enabled = true}}}

-- run coq.lua
vim.cmd("COQnow -s") ]]
