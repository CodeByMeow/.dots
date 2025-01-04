return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_transparent_background = 2
		-- vim.cmd("colorscheme everforest")
	end,
}
