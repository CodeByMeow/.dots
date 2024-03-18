local M = {
	"karb94/neoscroll.nvim",
	event = "BufReadPre",
}

function M.config()
	require("neoscroll").setup({
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
	})
end

return M
