local M = {
	"folke/flash.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
		},
	},
}

function M.config() end

return M
