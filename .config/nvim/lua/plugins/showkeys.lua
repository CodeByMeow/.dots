return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	config = {
		position = "top-right",
	},
	init = function()
		vim.cmd("ShowkeysToggle")
	end,
}
