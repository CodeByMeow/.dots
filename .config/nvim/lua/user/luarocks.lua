local M = {
	"vhyrro/luarocks.nvim",
	priority = 1001,
}

function M.config()
	require("luarocks-nvim").setup({
		rocks = { "magick", "neorg" },
	})
end

return M
