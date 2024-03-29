local M = {
	"NeogitOrg/neogit",
	opts = {},
	keys = {
		{ "<leader>g", vim.cmd.Neogit },
	},
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("neogit").setup({
		kind = "split",
		graph_style = "unicode",
	})
end

return M
