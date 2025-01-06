return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	config = {
		position = "bottom-right",
	},
	init = function()
		vim.cmd("ShowkeysToggle")
	end,
}
