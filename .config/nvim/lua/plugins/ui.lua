---@diagnostic disable: different-requires
return {
	-- BASE
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = true,
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
	-- INDENT
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	-- STATUS LINE
	{
		"tamton-aquib/staline.nvim",
		config = function()
			local git = require("config.icons").git
			local icons = require("config.icons").diagnostics

			local nicon = "NORM"
			local iicon = "INSR"
			local vicon = "VISU"
			local cicon = "COMM"
			local ricon = "REPL"
			local ticon = "TERM"

			local mode_icons = {
				["n"] = nicon,
				["no"] = nicon,
				["niI"] = nicon,
				["niR"] = nicon,
				["no"] = nicon,
				["niV"] = nicon,
				["nov"] = nicon,
				["noV"] = nicon,
				["i"] = iicon,
				["ic"] = iicon,
				["ix"] = iicon,
				["s"] = iicon,
				["S"] = iicon,
				["v"] = vicon,
				["V"] = vicon,
				[""] = vicon,
				["r"] = ricon,
				["r?"] = ricon,
				["c"] = cicon,
				["t"] = ticon,
				["!"] = ticon,
				["R"] = ricon,
			}

			require("staline").setup({
				sections = {
					left = { "-mode", "file_name", "branch", " ", "lsp" },
					mid = { "lsp_name" },
					right = { "file_size", vim.bo.fileencoding:upper(), "line_column" },
				},
				mode_icons = mode_icons,
				mode_colors = {
					i = "#83A598",
					n = "#928374",
					c = "#D65D0E",
					v = "#458588",
				},
				lsp_symbols = {
					Error = icons.Error,
					Info = icons.Info,
					Warn = icons.Warn,
					Hint = icons.Hint,
				},
				defaults = {
					true_colors = true,
					line_column = "[%l/%L] :%c 並%p%% ",
					branch_symbol = " ",
					lsp_client_symbol = "  ",
					mod_symbol = " " .. git.modified,
					cool_symbol = " " .. " ",
					full_path = false,
				},
			})
		end,
	},
	-- NOICE
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-notify",
		},
		config = function()
			local noice = require("noice")
			noice.setup({
				cmdline = {
					format = {
						cmdline = { icon = " " },
						search_down = { icon = " ▼ " },
						search_up = { icon = " ▲" },
						filter = { icon = " " },
						lua = { icon = "" },
						help = { icon = " " },
					},
				},

				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = {
						enabled = true,
						silent = true, -- set to true to not show a message if hover is not available
					},
				},
				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
				},
				views = {
					cmdline_popup = {
						border = {
							style = "rounded",
						},
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						},
					},
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
				},
			})

			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
	-- DIANOGTIC HELP
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
	-- WIN VIEW
	"sunjon/shade.nvim",
	-- HIGHLIGHT COLOR
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		-- config = true,
		opts = { user_default_options = { name = false, mode = "virtualtext" } },
	},
	-- TAKE A PICTURE
	"segeljakt/vim-silicon",
	-- SCROLL SMOOTH
	{ "karb94/neoscroll.nvim", config = true },
	-- STARTER
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[
⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠴⠶⠶⠒⠲⠦⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠲⠤⣄⡀⠀⠀⠀⠀⠀
⠀⠀⣀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡿⠀⠀⠀⠀⠀
⠀⢾⣅⡀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⢀⡦⠤⠄⠀⠀⢻⡀⠀⠀⠀⠀⠀
⠀⠈⢹⡏⠀⠀⠐⠋⠉⠁⠀⠻⢿⠟⠁⠀⠀⢤⠀⠀⠠⠤⢷⣤⣤⢤⡄⠀┏━━━━━━━━━━━━━━━━━━━━━━━━━━┓
⠀⠀⣼⡤⠤⠀⠀⠘⣆⡀⠀⣀⡼⠦⣄⣀⡤⠊⠀⠀⠀⠤⣼⠟⠀⠀⢹⡂┃ Good day, coding maestro!┃
⠀⠊⣿⡠⠆⠀⠀⠀⠈⠉⠉⠙⠤⠤⠋⠀⠀⠀⠀⠀⠀⡰⠋⠀⠀⠀⡼⠁┗━━━━━━━━━━━━━━━━━━━━━━━━━━┛
⠀⢀⡾⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠁⠀⠀⠀⣸⠁⠀
⠀⠀⠀⡼⠙⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀
⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀
⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀
⣾⠁⠀⢀⣠⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀
⠈⠛⠻⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀
]]
			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", ":Pick files<CR>"),
				dashboard.button("o", " " .. " Files Manager", ":lua MiniFiles.open()<CR>"),
				dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.opts.layout[1].val = 6
			return dashboard
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
			vim.api.nvim_create_autocmd("User", {
				callback = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime * 100) / 100
					local version = "   v"
						.. vim.version().major
						.. "."
						.. vim.version().minor
						.. "."
						.. vim.version().patch
					local plugin = "⚡ Neovim loaded "
						.. stats.loaded
						.. "/"
						.. stats.count
						.. " plugins in "
						.. ms
						.. "ms"
					local footer = version .. "\t" .. plugin .. "\n"
					dashboard.section.footer.val = footer
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
	-- MINIMAP
	{
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup()
			codewindow.apply_default_keybinds()
		end,
	},
}
