return {
	"b0o/incline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	priority = 1200,
	config = function()
		local helpers = require("incline.helpers")
		local devicons = require("nvim-web-devicons")
		local miniIcon = require("mini.icons")
		require("incline").setup({
			window = {
				padding = 0,
				margin = { horizontal = 0 },
			},
			hide = {
				cursorline = false,
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local _, ft_color = devicons.get_icon_color(filename)
				local ft_icon = miniIcon.get("filetype", vim.bo.filetype)
				local modified = vim.bo[props.buf].modified
				return {
					ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
					" ",
					{ filename, gui = modified and "italic" or "bold" },
					" ",
					guibg = "#44406e",
				}
			end,
		})
	end,
}
