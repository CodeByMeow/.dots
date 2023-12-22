return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				floats = "transparent", -- style for floating windows
			},
		})
		-- vim.api.nvim_set_hl(0, "HoverNormal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "HoverBorder", { bg = "none" })

		vim.cmd("colorscheme solarized-osaka")
	end,
}
