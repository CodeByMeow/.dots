return {
	"aserowy/tmux.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<C-Left>",
			function()
				require("tmux").move_left()
			end,
		},
		{
			"<C-Down>",
			function()
				require("tmux").move_bottom()
			end,
		},
		{
			"<C-Up>",
			function()
				require("tmux").move_top()
			end,
		},
		{
			"<C-Right>",
			function()
				require("tmux").move_right()
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
