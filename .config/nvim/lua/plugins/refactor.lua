local M = {
	"ThePrimeagen/refactoring.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>r",
			function()
				require("refactoring").select_refactor()
			end,
			mode = "v",
			noremap = true,
			silent = true,
			expr = false,
		},
	},
}

function M.config() end

return M
