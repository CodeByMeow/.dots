local nonicon = require("nvim-nonicons")
local git = require("core.kind").git
local icons = require("core.kind").diagnostics

local modes = {
	"n",
	"no",
	"niI",
	"niR",
	"no",
	"niV",
	"nov",
	"noV",
	"i",
	"ic",
	"ix",
	"s",
	"S",
	"v",
	"V",
	"",
	"r",
	"r?",
	"R",
	"c",
	"t",
	"!",
}

local mode_icons = {}
for _, mode in ipairs(modes) do
	mode_icons[mode] = nonicon.get("vim-" .. mode .. "-mode")
end

require("staline").setup({
	sections = {
		left = { "mode", "file_name", "branch", " ", "lsp" },
		mid = { "lsp_name" },
		right = { "file_size", vim.bo.fileencoding:upper(), "line_column" },
	},
	mode_icons = mode_icons,
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
		lsp_client_symbol = " ",
		mod_symbol = " " .. git.modified,
		cool_symbol = " " .. " ",
		full_path = false,
	},
})
