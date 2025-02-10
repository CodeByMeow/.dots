return {
	"kristijanhusak/vim-hybrid-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.enable_italic_font = 1
		vim.g.hybrid_transparent_background = 1
		vim.cmd("colorscheme hybrid_material")
	end,
}
