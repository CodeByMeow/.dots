local M = {
	"folke/zen-mode.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>z",
			function()
				require("zen-mode").toggle({
					window = {
						width = 0.65, -- width will be 85% of the editor width
					},
				})
			end,
		},
	},
}

function M.config()
	require("zen-mode").setup({
		plugins = {
			kitty = {
				enabled = true,
				font = "+2", -- font size increment
			},
			tmux = {
				enabled = true,
			},
			gitsigns = { enabled = false },
			twilight = { enabled = false },
		},
	})
end

return M
