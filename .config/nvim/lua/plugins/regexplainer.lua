return {
	"bennypowers/nvim-regexplainer",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	},
	event = "BufReadPre",
	opts = {
		mappings = {
			toggle = "g,",
		},
	},
}
