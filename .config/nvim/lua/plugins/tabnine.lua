local M = {
	"tzachar/cmp-tabnine",
	build = "./install.sh",
	dependencies = "hrsh7th/nvim-cmp",
	event = "InsertEnter",
}

M.config = function()
	require("cmp_tabnine").setup()
end

return M
