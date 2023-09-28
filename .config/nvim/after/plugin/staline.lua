local icons = require("core.kind").diagnostics
local catppuccin_mocha = {
	n = "#a6e3a1",
	i = "#f2cdcd",
	c = "#fab387",
	v = "#cba6f7", -- etc...
	s = "#f9e2af",
	R = "#f38ba8",
	V = "#cba6f7",
	t = "#89b4fa",
}

require("staline").setup({
	mode_colors = catppuccin_mocha,
	sections = {
		left = { "-mode", "file_name", "branch", " ", "lsp" },
		mid = { "lsp_name" },
		right = { "file_size", vim.bo.fileencoding:upper(), "line_column" },
	},
	mode_icons = {
		n = "NORMAL",
		i = "INSERT",
		c = "COMMAND",
		v = "VISUAL",
		V = "VISUAL",
		s = "SELECT",
		R = "REPLACE",
		t = "TERMINAL",
	},
	lsp_symbols = {
		Error = icons.Error,
		Info = icons.Info,
		Warn = icons.Warn,
		Hint = icons.Hint,
	},
	defaults = {
		true_colors = true,
		line_column = "[%l/%L] :%c 並%p%% ",
		branch_symbol = " ",
		lsp_client_symbol = " ",
		mod_symbol = "  ",
		cool_symbol = "  ",
		full_path = false,
	},
})
