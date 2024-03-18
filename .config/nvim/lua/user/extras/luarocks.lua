local M = {
	"vhyrro/luarocks.nvim",
}

function M.config()
	require("luarocks").setup({})
end

return M
