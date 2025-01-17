return {
	"folke/todo-comments.nvim",
	event = "BufReadPost",
	opts = {
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
	},
	keys = {
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},
	},
}
