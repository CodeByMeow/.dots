local M = {
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
}

function M.config()
	require("tmux").setup({
		copy_sync = {
			enable = true,
		},
		navigation = {
			enable_default_keybindings = false,
		},
		resize = {
			enable_default_keybindings = false,
		},
	})
end

return M
