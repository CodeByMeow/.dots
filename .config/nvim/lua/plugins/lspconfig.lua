local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
}

local function common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

local function on_attach(client, bufnr)
	local _, navic = pcall(require, "nvim-navic")
	if navic then
		navic.attach(client, bufnr)
	end
	vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename, { desc = "LSP Rename" })
	vim.keymap.set("n", "<leader>sa", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
end

function M.config()
	local lspconfig = require("lspconfig")
	local servers = require("mason-lspconfig").get_installed_servers()
	local icons = require("config.icons").diagnostics

	require("lspconfig.ui.windows").default_options.border = "rounded"
	for _, server in ipairs(servers) do
		local opts = {
			capabilities = common_capabilities(),
			on_attach = on_attach,
		}

		local require_ok, settings = pcall(require, "config.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		lspconfig[server].setup(opts)
	end

	vim.diagnostic.config({
		virtual_lines = true,
		virtual_text = false,
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = icons.Error,
				[vim.diagnostic.severity.WARN] = icons.Warn,
				[vim.diagnostic.severity.HINT] = icons.Hint,
				[vim.diagnostic.severity.INFO] = icons.Info,
			},
		},
	})

	vim.api.nvim_create_autocmd("CursorMoved", {
		pattern = "*",
		callback = function()
			vim.diagnostic.open_float(nil, { focusable = false })
		end,
	})
end

return M
