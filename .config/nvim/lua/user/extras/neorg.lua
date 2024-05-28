local M = {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
}

function M.config()
	require("neorg").setup()
end

return M
