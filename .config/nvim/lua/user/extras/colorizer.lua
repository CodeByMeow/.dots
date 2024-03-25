local M = {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("colorizer").setup({
		user_default_options = {
			names = false,
			rgb_fn = true,
			hsl_fn = true,
			tailwind = "both",
		},
		buftypes = {},
	})
end

return M
