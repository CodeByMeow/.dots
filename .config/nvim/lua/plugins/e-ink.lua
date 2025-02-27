return {
	"alexxGmZ/e-ink.nvim",
	priority = 1000,
	config = function()
		require("e-ink").setup()
		vim.cmd.colorscheme("e-ink")
	end,
}
