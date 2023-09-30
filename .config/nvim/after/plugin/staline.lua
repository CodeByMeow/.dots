local icons = require("core.kind").diagnostics
local git = require("core.kind").git
local nonicon = require("nvim-nonicons")
local vimNormalMode = nonicon.get("vim-normal-mode")
local vimInsertMode = nonicon.get("vim-insert-mode")
local vimReplaceMode = nonicon.get("vim-replace-mode")
local vimSelectMode = nonicon.get("vim-select-mode")
local vimTerminalMode = nonicon.get("vim-terminal-mode")
local vimVisualMode = nonicon.get("vim-visual-mode")
local vimCommandMode = nonicon.get("vim-command-mode")

require("staline").setup({
	sections = {
		left = { "mode", "file_name", "branch", " ", "lsp" },
		mid = { "lsp_name" },
		right = { "file_size", vim.bo.fileencoding:upper(), "line_column" },
	},
	mode_icons = {
		["n"] = vimNormalMode,
		["no"] = vimNormalMode,
		["niI"] = vimNormalMode,
		["niR"] = vimNormalMode,
		["no"] = vimNormalMode,
		["niV"] = vimNormalMode,
		["nov"] = vimNormalMode,
		["noV"] = vimNormalMode,
		["i"] = vimInsertMode,
		["ic"] = vimInsertMode,
		["ix"] = vimInsertMode,
		["s"] = vimSelectMode,
		["S"] = vimSelectMode,
		["v"] = vimVisualMode,
		["V"] = vimVisualMode,
		[""] = vimVisualMode,
		["r"] = vimReplaceMode,
		["r?"] = vimReplaceMode,
		["R"] = vimReplaceMode,
		["c"] = vimCommandMode,
		["t"] = vimTerminalMode,
		["!"] = vimTerminalMode,
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
		lsp_client_symbol = " ",
		mod_symbol = " " .. git.modified,
		cool_symbol = " " .. " ",
		full_path = false,
	},
})
