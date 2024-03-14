local function load_config(package)
	return function() require('plugins.' .. package) end
end

return {
	-- UI
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require('gruvbox').setup {
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			}
			vim.cmd("colorscheme gruvbox")
		end,
		opts = {}
	},
	-- BASE
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = true,
	},
	{ "MunifTanjim/nui.nvim",  lazy = true },
	-- STATUS LINE
	{ "j-hui/fidget.nvim",     config = true, event = { "BufReadPre", "BufNewFile" } },
	{
		'nvim-lualine/lualine.nvim',
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			{ 'dpayne/CodeGPT.nvim', config = function() require("codegpt.config") end }
		},
		config = function()
			local icons = require('lib.icons').diagnostics
			local CodeGPTModule = require("codegpt")
			local auto_theme_custom = require('lualine.themes.auto')
			local branch_max_width = 40
			local branch_min_width = 10
			auto_theme_custom.normal.c.bg = "NONE"
			require('lualine').setup {
				options = {
					theme = auto_theme_custom
				},
				sections = {
					lualine_a = { 'mode',
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
									return output:sub(1, (max / 2) - 1)
										.. "..."
										.. output:sub(-1 * ((max / 2) - 1), -1)
								end
								return output
							end,
						},

					},
					lualine_b = { 'diff' },
					lualine_c = {
						'filename',
						{
							'diagnostics',
							symbols = { error = icons.Error, warn = icons.Warn, info = icons.Info, hint = icons.Hint },
						}
					},
					lualine_x = {
						CodeGPTModule.get_status,
						{
							function()
								local lsps = vim.lsp.get_clients()
								local icon = require("nvim-web-devicons").get_icon_by_filetype(
									vim.bo.filetype
								)
								if lsps and #lsps > 0 then
									local names = {}
									for _, lsp in ipairs(lsps) do
										table.insert(names, lsp.name)
									end
									return string.format("%s %s", table.concat(names, ", "), icon)
								else
									return icon or ""
								end
							end,
							on_click = function()
								vim.api.nvim_command("LspInfo")
							end,
							color = function()
								local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
									vim.bo.filetype
								)
								return { fg = color }
							end,
						} },
					lualine_y = {
						'filesize',
						'encoding'
					},
					lualine_z = {
						'progress',
						'location',
					}
				},
			}
		end
	},
	-- HIGHLIGHT COLOR
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
	},
	-- TAKE A PICTURE
	{ "segeljakt/vim-silicon",        lazy = true },
	-- SCROLL SMOOTH
	{
		"karb94/neoscroll.nvim",
		event = "BufReadPre",
		config = function()
			require('neoscroll').setup({
				mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
			})
		end
	},
	-- STARTER
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[     █  █     ]],
				[[     ██ ██     ]],
				[[     █████     ]],
				[[     ██ ███     ]],
				[[     █  █     ]],
				[[]],
				[[N  E  O   V  I  M]],
			}

			vim.api.nvim_set_hl(0, "GreenF", {
				fg = "#A9B665",
				bg = nil,
			})
			vim.api.nvim_set_hl(0, "BlueF", {
				fg = "#7DAEA3",
				bg = nil,
			})
			vim.api.nvim_set_hl(0, "GreenFBlueB", {
				fg = "#A9B665",
				bg = "#7DAEA3",
			})
			dashboard.section.header.opts.hl = {
				{ { "BlueF", 5, 7 },  { "GreenF", 8, 22 } },
				{ { "BlueF", 5, 8 },  { "GreenFBlueB", 8, 11 }, { "GreenF", 9, 24 } },
				{ { "BlueF", 5, 10 }, { "GreenF", 10, 12, },    { "GreenF", 12, 26 } },
				{ { "BlueF", 5, 11 }, { "GreenF", 12, 24 } },
				{ { "BlueF", 5, 11 }, { "GreenF", 12, 22 } },
				{ { "BlueF", 5, 11 }, { "GreenF", 12, 22 } },
				{ { "BlueF", 0, 9 },  { "GreenF", 9, 18 } },
			}
			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", ":Pick files<CR>"),
				dashboard.button("o", " " .. " Files Manager", ":lua MiniFiles.open()<CR>"),
				dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			-- dashboard.section.header.opts.hl = "AlphaHeader"
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
	{
		"rcarriga/nvim-notify",
		config = function()
			local banned_messages = { "No information available" }
			vim.notify = vim.schedule_wrap(function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				return require("notify")(msg, ...)
			end)
			require("notify").setup {
				background_colour = "#000000",
				render = "wrapped-compact",
				stages = "slide",
			}
		end,
		event = "VeryLazy"
	},
	-- FILENAME
	{
		"b0o/incline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		priority = 1200,
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.base0, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},
	-- MOVE
	{
		"folke/flash.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"s",
				function()
					require("flash").jump()
				end,
			},
		},
	},
	-- ESCAPE
	{ "max397574/better-escape.nvim", opts = { mapping = { "ii" }, key = "<ESC>" }, event = "InsertEnter" },
	-- QUICK REOPEN
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			local harpoon2 = require('harpoon'):setup()
			vim.keymap.set("n", "ha", function() harpoon2:list():append() end)
			vim.keymap.set("n", "hm", function() harpoon2.ui:toggle_quick_menu(harpoon2:list()) end)
			vim.keymap.set("n", "hn", function() harpoon2:list():next() end)
			vim.keymap.set("n", "he", function() harpoon2:list():prev() end)
		end
	},
	-- TMUX VIM
	{
		"aserowy/tmux.nvim",
		event = "VeryLazy",
		opts = {
			copy_sync = {
				enable = true,
			},
			navigation = {
				enable_default_keybindings = false,
			},
			resize = {
				enable_default_keybindings = false,
			},
		},
		keys = {
			{
				"<C-h>",
				function()
					require("tmux").move_left()
				end,
			},
			{
				"<C-n>",
				function()
					require("tmux").move_bottom()
				end,
			},
			{
				"<C-e>",
				function()
					require("tmux").move_top()
				end,
			},
		},
		config = true,
	},
	-- UNDO TREE
	{
		"mbbill/undotree",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle } }
	},
	-- SURROUND
	{
		"kylechui/nvim-surround",
		config = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	-- ICONS PICKER
	{
		"ziontee113/icon-picker.nvim",
		keys = { { "<leader><leader>y", "<cmd>:IconPickerYank emoji nerd_font <cr>" } },
		dependencies = "stevearc/dressing.nvim",
		config = true,
		lazy = true
	},
	-- FORMAT
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				sh = { "beautysh" },
				["*"] = { "codespell" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		},
		keys = {
			{
				"fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
			},
		},
	},
	-- SUDO
	{ "lambdalisue/suda.vim" },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
	},
	-- GIT
	{
		"NeogitOrg/neogit",
		opts = {
			kind = "split",
			graph_style = "unicode"
		},
		keys = {
			{ "<leader>g", vim.cmd.Neogit },
		},
		event = { "BufReadPre", "BufNewFile" }
	},
	{
		"bennypowers/nvim-regexplainer",
		config = function()
			require("regexplainer").setup({
				mappings = {
					toggle = "g,",
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"toppair/peek.nvim",
		event = { "BufReadPre", "BufNewFile" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = 'browser',
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"folke/zen-mode.nvim",
		event = "BufReadPre",
		keys = {
			{ '<leader>z', function()
				require("zen-mode").toggle({
					window = {
						width = .65 -- width will be 85% of the editor width
					}
				})
			end }
		},
		opts = {
			plugins = {
				kitty = {
					enabled = true,
					font = "+2", -- font size increment
				},
				tmux = {
					enabled = true
				},
				gitsigns = { enabled = false },
			}
		}

	},
	{
		"folke/twilight.nvim",
		opts = {},
		keys = {
			{ '<leader>l', '<cmd>:Twilight<cr>' }
		}
	},
	-- MINI
	{
		"echasnovski/mini.nvim",
		version = false,
		lazy = false,
		event = { "BufReadPre" },
		config = function()
			require("mini.pick").setup()
			require("mini.basics").setup()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.tabline").setup()
			require("mini.trailspace").setup()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
			require("mini.files").setup({
				content = {
					filter = function(fs_entry)
						if fs_entry.fs_type == "directory" and fs_entry.name == "node_modules" then
							return false
						end

						return true
					end,
				},
				mappings = {
					go_in = "i",
					go_in_plus = "I",
					synchronize = "<leader>w",
				},
			})
			require("mini.hipatterns").setup({
				highlighters = {
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "TSDanger" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "TSWarning" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "TSTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "TSNote" },
				},
			})
			require("mini.move").setup({
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<M-h>",
					right = "<M-i>",
					down = "<M-n>",
					up = "<M-e>",

					-- Move current line in Normal mode
					line_left = "<M-h>",
					line_right = "<M-i>",
					line_up = "<M-u>",
					line_down = "<M-d>",
				},
			})
			require("mini.animate").setup {
				scroll = {
					enable = true
				}
			}
		end,
		keys = {
			{
				"<leader>f",
				function()
					vim.cmd("Pick files")
				end,
			},
			{
				"<leader>ff",
				function()
					vim.cmd("Pick grep_live")
				end,
			},
			{
				"<leader>b",
				function()
					vim.cmd("Pick buffers")
				end,
			},
			{
				"<leader>h",
				function()
					vim.cmd("Pick help")
				end,
			},
			{
				"<leader>o",
				function()
					vim.cmd(":lua MiniFiles.open()")
				end,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
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
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/playground",
			"windwp/nvim-ts-autotag",
			"David-Kunz/markid",
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = function()
					local npairs = require("nvim-autopairs")
					local Rule = require("nvim-autopairs.rule")

					npairs.setup({
						check_ts = true,
						ts_config = {
							lua = { "string" }, -- it will not add a pair on that treesitter node
							javascript = { "template_string" },
							java = false, -- don't check treesitter on java
						},
						disable_filetype = { "Telescope", "vim" },
					})

					local ts_conds = require("nvim-autopairs.ts-conds")

					-- press % => %% only while inside a comment or string
					npairs.add_rules({
						Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
						Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
					})
				end,
			},
			{
				'Wansmer/treesj',
				keys = { '<space>m', '<space>j', '<space>s' },
				dependencies = { 'nvim-treesitter/nvim-treesitter' },
				config = function()
					require('treesj').setup()
				end,
			},
			"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		},
		keys = {
			{ "<leader>p", vim.cmd.TSPlaygroundToggle },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"javascript",
					"typescript",
					"lua",
					"css",
					"php",
					"jsdoc",
					"json",
					"tsx",
					"markdown",
					"markdown_inline",
					"vim",
					"bash",
					"prisma",
					"regex",
					"java"
				},
				auto_install = true,
				highlight = { enable = true },
				rainbow = { enable = true, disable = { "html" } },
				autopairs = { enable = true },
				autotag = { enable = true },
				incremental_selection = { enable = true },
				indent = { enable = true, disable = { "yaml" } },
				markid = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["oa"] = { query = "@assignment.outer", desc = "Select outer part of the assignment" },
							["ia"] = { query = "@assignment.inner", desc = "Select inner part of the assignment" },
							["la"] = { query = "@assignment.lhs", desc = "Select left hand side of the assignment" },
							["ra"] = { query = "@assignment.rhs", desc = "Select right hand side of the assignment" },

							["af"] = { query = "@function.outer", desc = "Select outer part of the function" },
							["if"] = { query = "@function.inner", desc = "Select inner part of the function" },
						},
					},
					swap = {
						enable = true,
						swap_next = { ["<leader>sn"] = "@parameter.inner" },
						swap_previous = { ["<leader>sp"] = "@parameter.inner" },
					},
				},
				ignore_install = { "help" },
			})
		end,
	},
	"williamboman/mason.nvim",
	-- AUTOCOMPLETION
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	-- SNIPPETS
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
	{ "dcampos/cmp-emmet-vim", dependencies = { "mattn/emmet-vim" } },
	-- LSP SUPPORT
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			'neovim/nvim-lspconfig',
			'williamboman/mason-lspconfig.nvim',
		},
		event = { "BufReadPre", "BufNewFile" },
		config = load_config("lsp")
	},
	-- LSPSAGA
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			local kind = require("lib.icons").kind
			require("lspsaga").setup({
				ui = {
					kind = kind,
					border = "single",
					code_action = "󰆤 ",
				},
				beacon = {
					enable = true,
				}
			})
		end,
		keys = {
			{ "gf",         "<cmd>Lspsaga finder<CR>" },
			{ "gr",         "<cmd>Lspsaga rename<CR>" },
			{ "grp",        "<cmd>Lspsaga rename ++project<CR>" },
			{ "gt",         "<cmd>Lspsaga peek_definition<CR>" },
			{ "gd",         "<cmd>Lspsaga goto_definition<CR>" },
			{ "sd",         "<cmd>Lspsaga show_buf_diagnostics<CR>" },
			{ "<leader>n",  "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
			{ "<leader>e",  "<cmd>Lspsaga diagnostic_jump_next<CR>" },
			{ "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
			{ "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
			{ "H",          "<cmd>Lspsaga hover_doc<CR>" },
			{ "ga",         "<cmd>Lspsaga code_action<CR>",         mode = { "n", "v" } },
			{ "go",         "<cmd>Lspsaga outline<CR>",             mode = { "n", "v" } },
			{ "<leader>t",  "<cmd>Lspsaga term_toggle<CR>",         mode = { "n", "t" } }
		}
	},
	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
		-- stylua: ignore
		event = "InsertEnter",
		keys = {
			{ "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
			{ "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%d/%m/%Y"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},
	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
	},
	-- AI GPT
	{
		"james1236/backseat.nvim",
		config = function()
			require("backseat").setup({
				openai_api_key = vim.env.OPENAI_API_KEY,
				openai_model_id = 'gpt-3.5-turbo',
			})
		end,
	},
	-- CODEIUM
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
		event = "BufReadPre",
		lazy = true
	},
	{
		"lukas-reineke/headlines.nvim",
		event = "BufReadPre",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			vim.cmd([[highlight Headline1 guibg=#295715 guifg=white]])
			vim.cmd([[highlight Headline2 guibg=#8d8200 guifg=white]])
			vim.cmd([[highlight Headline3 guibg=#a56106 guifg=white]])
			vim.cmd([[highlight Headline4 guibg=#7e0000 guifg=white]])
			vim.cmd([[highlight Headline5 guibg=#1e0b7b guifg=white]])
			vim.cmd([[highlight Headline6 guibg=#560b7b guifg=white]])
			vim.cmd([[highlight CodeBlock guibg=#09090d]])
			vim.cmd([[highlight Dash guifg=white]])

			require("headlines").setup({
				markdown = {
					fat_headlines = true,
					fat_headline_upper_string = "▄",
					fat_headline_lower_string = "-",
					headline_highlights = {
						"Headline1",
						"Headline2",
						"Headline3",
						"Headline4",
						"Headline5",
						"Headline6",
					},
				},
			})
		end,
	},
	-- HTTP
	{
		"rest-nvim/rest.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		event = { 'BufReadPre', 'BufNewFile' },
		ft = 'http',
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- stay in current windows (.http file) or change to results window (default)
				stay_in_current_window_after_split = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					-- table of curl `--write-out` variables or false if disabled
					-- for more granular control see Statistics Spec
					show_statistics = false,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = '.env',
				-- for telescope select
				env_pattern = "\\.env$",
				env_edit_command = "tabedit",
				custom_dynamic_variables = {},
				yank_dry_run = true,
				search_back = true,
			})
		end,
		keys = { {
			"<leader>ht", "<Plug>RestNvim", desc = "Test current file"
		} }
	}

}
