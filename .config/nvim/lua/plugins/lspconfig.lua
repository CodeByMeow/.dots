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

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

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

	-- Show diagnostic current line only
	local ns = vim.api.nvim_create_namespace("CurlineDiag")
	vim.opt.updatetime = 100
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = args.buf,
				callback = function()
					pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
					local hi = { "Error", "Warn", "Info", "Hint" }
					local curline = vim.api.nvim_win_get_cursor(0)[1]
					local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
					local virt_texts = { { (" "):rep(4) } }
					for _, diag in ipairs(diagnostics) do
						virt_texts[#virt_texts + 1] =
							{ icons[hi[diag.severity]] .. diag.message, "Diagnostic" .. hi[diag.severity] }
					end
					vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
						virt_text = virt_texts,
						hl_mode = "combine",
					})
				end,
			})
		end,
	})
end

return M
