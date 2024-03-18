local M = {
	"mbbill/undotree",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle },
	},
}

function M.config() end

return M
