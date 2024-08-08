return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	keys = {
		{ "<leader>t", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { desc = "Toggle terminal" } },
	},
}
