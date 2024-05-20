local M = {
	"NeogitOrg/neogit",
	opts = {},
	keys = {
		{ "<leader>g", vim.cmd.Neogit },
	},
	event = { "BufReadPre", "BufNewFile" },
	branch = "master",
}

function M.config()
	require("neogit").setup({
		kind = "split",
		graph_style = "unicode",
	})
end

return M
