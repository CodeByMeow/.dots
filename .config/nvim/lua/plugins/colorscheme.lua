return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			dim_inactive = true,
			transparent_mode = true,
		})
		vim.cmd("colorscheme gruvbox")
		vim.api.nvim_set_hl(0, "HoverNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "HoverBorder", { bg = "none" })
	end,
}
