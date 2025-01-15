return {
	"folke/trouble.nvim",
	specs = {
		"folke/snacks.nvim",
		opts = function(_, opts)
			return vim.tbl_deep_extend("force", opts or {}, {
				picker = {
					actions = require("trouble.sources.snacks").actions,
					win = {
						input = {
							keys = {
								["<leader>se"] = {
									"trouble_open",
									mode = { "n", "i" },
								},
							},
						},
					},
				},
			})
		end,
	},
}
