local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
	replace_netrw = true,
	ui = {
		border = "rounded",
		height = 0.65,
		width = 0.65,
		x = 0.5,
		y = 0.5,
	},
})

vim.api.nvim_set_keymap("n", "rg", "", {
	noremap = true,
	callback = function()
		ranger_nvim.open(true)
	end,
})
