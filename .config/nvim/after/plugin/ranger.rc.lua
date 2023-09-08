local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
	replace_netrw = true,
	ui = {
		border = "solid",
		height = 0.7,
		width = 0.7,
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
