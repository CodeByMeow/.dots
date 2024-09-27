return {
	-- coment
	"sainnhe/everforest",
	lazy=false,
	priority=1000,
	config = function ()
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_transparent_background = 0
		vim.cmd("colorscheme everforest")
	end
}
