return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	opts = {
		position = "bottom-right",
	},
	init = function()
		vim.cmd("ShowkeysToggle")
	end,
}
