require("formatter").setup({
	logging = false,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
			require("formatter.filetypes.typescriptreact").eslint_d,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
			require("formatter.filetypes.typescript").eslint_d,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		json = {
			require("formatter.filetypes.json").jsbeautify,
			require("formatter.filetypes.json").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePost", { command = "FormatWrite" })
