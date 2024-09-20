return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			hide_fillchars = false,
			borderless_telescope = true,
			terminal_colors = true,
			theme = {
				highlights = {
					Comment = { fg = "#696969", bg = "NONE", italic = true },
				},
			},
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
