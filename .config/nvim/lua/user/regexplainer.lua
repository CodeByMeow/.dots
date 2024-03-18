local M = {
	"bennypowers/nvim-regexplainer",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	require("regexplainer").setup({
		mappings = {
			toggle = "g,",
		},
	})
end

return M
