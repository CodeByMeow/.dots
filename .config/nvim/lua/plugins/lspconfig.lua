local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
}

local function common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

local function on_attach()
	vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename, { desc = "LSP Rename" })
	vim.keymap.set("n", "<leader>sa", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
end

function M.config()
	local lspconfig = require("lspconfig")
	local servers = require("mason-lspconfig").get_installed_servers()
	local icons = require("config.icons").diagnostics

	local hover = vim.lsp.buf.hover
	---@diagnostic disable-next-line: duplicate-set-field
	vim.lsp.buf.hover = function()
		return hover({
			border = "rounded",
			max_height = math.floor(vim.o.lines * 0.5),
			max_width = math.floor(vim.o.columns * 0.4),
		})
	end
	local signature_help = vim.lsp.buf.signature_help
	---@diagnostic disable-next-line: duplicate-set-field
	vim.lsp.buf.signature_help = function()
		return signature_help({
			border = "rounded",
			max_height = math.floor(vim.o.lines * 0.5),
			max_width = math.floor(vim.o.columns * 0.4),
		})
	end

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
