local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

local server_names = {
	"ts_ls",
	"lua_ls",
	"cssls",
	"html",
	"jsonls",
	"eslint",
	"prismals",
	"tailwindcss",
	"emmet_ls",
}

function M.config()
	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = server_names,
		automatic_installation = true,
	})
end

return M
