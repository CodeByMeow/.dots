return {
	"folke/flash.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"f",
			function()
				require("flash").jump()
			end,
		},
	},
}
