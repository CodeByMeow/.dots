---@diagnostic disable: different-requires
return {
	-- BASE
	"nvim-lua/plenary.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = true,
	},
	"yamatsum/nvim-nonicons",
	{ "MunifTanjim/nui.nvim", lazy = true },
	-- MINI
	{
		"echasnovski/mini.nvim",
		version = false,
		lazy = false,
		config = function()
			require("mini.pick").setup()
			require("mini.basics").setup()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.tabline").setup()
			require("mini.align").setup({ mappings = {
				start = "ma",
				start_with_preview = "mA",
			} })
			require("mini.files").setup({
				mappings = {
					go_in = "i",
					go_in_plus = "I",
					synchronize = "<leader>w",
				},
			})
			require("mini.hipatterns").setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
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
					line_up = "<M-e>",
					line_down = "<M-n>",
				},
			})
		end,
		keys = {
			{
				"<leader>f",
				function()
					vim.cmd("Pick files")
				end,
			},
			{
				"<leader>z",
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
				"<leader>e",
				function()
					MiniFiles.open()
				end,
			},
		},
	},
	-- THEME
	{
		"svrana/neosolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		dependencies = { "tjdevries/colorbuddy.nvim" },
		config = function()
			local n = require("neosolarized").setup({
				comment_italics = true,
			})
			n.Group.link("HoverNormal", n.groups.Normal)
			n.Group.link("HoverBorder", n.groups.Information)
			n.Group.link("MiniPickMatchCurrent", n.groups.PmenuSel)
			n.Group.link("@string", n.Group.new("SteamString", n.colors.cyan, n.colors.none, n.styles.italic))
			n.Group.link("@keyword", n.Group.new("SteamKeyWord", n.colors.green, n.colors.none, n.styles.italic))
		end,
	},
	-- INDENT
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({ scope = { highlight = highlight } })
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	-- MOVE
	{ "folke/flash.nvim", event = "VeryLazy", keys = { {
		"s",
		function()
			require("flash").jump()
		end,
	} } },
	-- ESCAPE
	{ "max397574/better-escape.nvim", opts = { mapping = { "ii" }, key = "<ESC>" } },
	-- QUICK REOPEN
	{
		"ThePrimeagen/harpoon",
		keys = {
			{
				"ha",
				function()
					require("harpoon.mark").add_file()
				end,
			},
			{
				"hm",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
			},
			{
				"hn",
				function()
					require("harpoon.ui").nav_next()
				end,
			},
			{
				"he",
				function()
					require("harpoon.ui").nav_prev()
				end,
			},
		},
	},
	-- STATUS LINE
	{
		"tamton-aquib/staline.nvim",
		config = function()
			require("plugins.config.staline")
		end,
	},

	-- TMUX VIM
	{
		"aserowy/tmux.nvim",
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
	-- HIGHLIGHT SYNTAX
	{
		"nvim-treesitter/nvim-treesitter",
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
					require("plugins.config.autopairs")
				end,
			},
			"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		},
		keys = {
			{ "<leader>p", vim.cmd.TSPlaygroundToggle },
		},
		config = function()
			require("plugins.config.treesitter")
		end,
	},
	-- LSP SUPPORT
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, config = false },
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	-- AUTOCOMPLETION
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-calc",
	-- SNIPPETS
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	"rafamadriz/friendly-snippets",
	-- NOICE
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
		config = function()
			require("plugins.config.noice")
		end,
	},
	-- ICONS PICKER
	{
		"ziontee113/icon-picker.nvim",
		keys = { { "<leader><leader>y", "<cmd>:IconPickerYank emoji nerd_font<cr>" } },
		dependencies = "stevearc/dressing.nvim",
		config = true,
	},
	-- UNDO TREE
	{ "mbbill/undotree", keys = { { "<leader>u", vim.cmd.UndotreeToggle } } },
	-- SURROUND
	{ "kylechui/nvim-surround", config = true },
	-- DIANOGTIC HELP
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
	-- WIN VIEW
	"sunjon/shade.nvim",
	-- SUDO
	"lambdalisue/suda.vim",
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
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 500,
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
	-- MARKDOWN PREVIEW
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- GIT
	{ "lewis6991/gitsigns.nvim", opts = { current_line_blame = true }, event = "VeryLazy" },
	{ "NeogitOrg/neogit", opts = { kind = "auto" }, config = true, keys = { { "<leader>g", vim.cmd.Neogit } } },
	-- LSPSAGA
	{ "nvimdev/lspsaga.nvim", event = "LspAttach" },
	-- HIGHLIGHT COLOR
	{ "brenoprata10/nvim-highlight-colors", config = true },
	-- MINIMAP
	{
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup()
			codewindow.apply_default_keybinds()
		end,
	},
	-- TAKE A PICTURE
	"segeljakt/vim-silicon",
	-- LEETCODE
	{ "kawre/leetcode.nvim", opts = {
		lang = "typescript",
	} },
	-- SCROLL SMOOTH
	{ "karb94/neoscroll.nvim", config = true },
	-- STARTER
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[
                                             
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", ":Pick files<CR>"),
				dashboard.button("g", " " .. " Find text", ":Pick grep_live<CR>"),
				dashboard.button("e", " " .. " Files Manager", ":lua MiniFiles.open()<CR>"),
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
					local version = "  󰥱 v"
						.. vim.version().major
						.. "."
						.. vim.version().minor
						.. "."
						.. vim.version().patch
					local plugin = "󱐌 Neovim loaded " .. stats.loaded .. " plugins ﮣ in " .. ms .. "ms"
					local footer = version .. "\t" .. plugin .. "\n"
					dashboard.section.footer.val = footer
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}
