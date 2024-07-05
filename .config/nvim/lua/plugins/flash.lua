return {
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
