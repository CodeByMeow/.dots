return {
	"mbbill/undotree",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle },
	},
}
