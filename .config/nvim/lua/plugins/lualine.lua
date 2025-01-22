return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local icons = require("config.icons").diagnostics
		local auto_theme_custom = require("lualine.themes.auto")
		local branch_max_width = 40
		local branch_min_width = 10
		auto_theme_custom.normal.c.bg = "NONE"
		require("lualine").setup({
			options = {
				theme = auto_theme_custom,
				component_separators = { left = "▒", right = "▒" },
				section_separators = { left = "▒", right = "▒" },
			},
			extensions = { "quickfix", "man", "fugitive" },
			sections = {
				lualine_a = {
					"mode",
					{
						"branch",
						fmt = function(output)
							local win_width = vim.o.columns
							local max = branch_max_width
							if win_width * 0.25 < max then
								max = math.floor(win_width * 0.25)
							end
							if max < branch_min_width then
								max = branch_min_width
							end
							if max % 2 ~= 0 then
								max = max + 1
							end
							if output:len() >= max then
								return output:sub(1, (max / 2) - 1) .. "..." .. output:sub(-1 * ((max / 2) - 1), -1)
							end
							return output
						end,
					},
				},
				lualine_b = { "diff" },
				lualine_c = {
					{
						function()
							local ft_icon = require("mini.icons").get("filetype", vim.bo.filetype)
							return string.format("%s", ft_icon)
						end,
						color = function()
							local _, color =
								require("nvim-web-devicons").get_icon_cterm_color_by_filetype(vim.bo.filetype)
							return { fg = color }
						end,
					},
					{
						function()
							local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
							return string.format("%s", filename)
						end,
					},
					{
						"diagnostics",
						symbols = { error = icons.Error, warn = icons.Warn, info = icons.Info, hint = icons.Hint },
					},
				},
				lualine_x = {
					function()
						if vim.g.toggle_colemark then
							return "  Colemak"
						else
							return "  Default"
						end
					end,
				},
				lualine_y = {
					{
						function()
							local lsps = vim.lsp.get_clients()
							if lsps and #lsps > 0 then
								local names = {}
								for _, lsp in ipairs(lsps) do
									table.insert(names, lsp.name)
								end
								return string.format("󱜚 %s", table.concat(names, ", "))
							else
								return ""
							end
						end,
					},
					"filesize",
					"encoding",
				},
				lualine_z = {
					"location",
					"progress",
				},
			},
		})
	end,
}
