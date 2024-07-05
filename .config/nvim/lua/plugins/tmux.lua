return {
	"aserowy/tmux.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<C-h>",
			function()
				require("tmux").move_left()
			end,
		},
		{
			"<C-n>",
			function()
				require("tmux").move_bottom()
			end,
		},
		{
			"<C-e>",
			function()
				require("tmux").move_top()
			end,
		},
	},
	opts = {
		copy_sync = {
			enable = true,
		},
		navigation = {
			enable_default_keybindings = false,
		},
		resize = {
			enable_default_keybindings = false,
		},
	},
}
