local M = {
	"sainnhe/everforest",
	priority = 1000,
}

function M.config()
	vim.g.everforest_enable_italic = true
	vim.g.everforest_transparent_background = true
	vim.g.everforest_diagnostic_text_highlight = true

	vim.cmd("colorscheme everforest")
end

return M
