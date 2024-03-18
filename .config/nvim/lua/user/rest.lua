local M = {
	"rest-nvim/rest.nvim",
	dependencies = { "luarocks.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	ft = "http",
}

function M.config()
	require("rest-nvim").setup()
end

return M
