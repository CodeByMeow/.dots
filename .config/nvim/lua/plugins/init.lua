return {
	-- THEME
	{ "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
	{
		"svrana/neosolarized.nvim",
		dependencies = { "tjdevries/colorbuddy.nvim" },
		opts = { comment_italics = true, background_set = false },
	},
	-- BASE
	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = true, config = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	-- STATUS LINE
	"tamton-aquib/staline.nvim",
	-- TELESCOPE
	"nvim-telescope/telescope.nvim",
	-- ESCAPE
	{ "max397574/better-escape.nvim", opts = { mapping = { "ii" }, key = "<ESC>" } },
	-- BUFTER
	{
		"akinsho/bufferline.nvim",
		version = "*",
		keys = {
			{ "<TAB>", vim.cmd.BufferLineCycleNext },
			{ "<S-TAB>", vim.cmd.BufferLineCyclePrev },
		},
		config = true,
		event = "VeryLazy",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local kind = require("core.kind")
					local icon = level:match("error") and kind.diagnostics.Error or kind.diagnostics.Warn
					return " " .. icon .. count
				end,
			},
		},
	},
	-- INDENT
	"lukas-reineke/indent-blankline.nvim",
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
	-- SCROLL SMOOTH
	{ "karb94/neoscroll.nvim", config = true },
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
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"David-Kunz/markid",
			"nvim-treesitter/nvim-treesitter-textobjects",
			{ "windwp/nvim-autopairs", event = "InsertEnter" },
			"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		},
		keys = {
			{ "<leader>p", vim.cmd.TSPlaygroundToggle },
		},
	},
	-- CURRENT WORD
	"RRethy/vim-illuminate",
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, config = false },
	-- LSP SUPPORT
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
	{ "tzachar/cmp-tabnine", build = "./install.sh" },
	-- NOICE
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-notify",
		},
	},
	-- ICONS PICKER
	{
		"ziontee113/icon-picker.nvim",
		keys = { { "<leader><leader>y", vim.cmd.IconPickerYank } },
		dependencies = "stevearc/dressing.nvim",
		config = true,
	},
	-- FILE MANAGER
	{
		"stevearc/oil.nvim",
		keys = { {
			"<leader>i",
			vim.cmd.Oil,
		} },
		opts = {
			columns = {
				"icon",
				"size",
			},
			keymaps = {
				["q"] = "actions.close",
			},
		},
	},
	-- COMMENT
	{ "numToStr/Comment.nvim", config = true },
	-- UNDO TREE
	{
		"mbbill/undotree",
		keys = { { "<leader>u", vim.cmd.UndotreeToggle } },
	},
	-- SURROUND
	{ "kylechui/nvim-surround", config = true },
	-- DIANOGTIC HELP
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
	-- WIN VIEW
	"sunjon/shade.nvim",
	-- MOVE
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = { {
			"s",
			function()
				require("flash").jump()
			end,
		} },
	},
	-- SUDO
	"lambdalisue/suda.vim",
	-- FORMAT
	{
		"nvimdev/guard.nvim",
		dependencies = {
			"nvimdev/guard-collection",
		},
		keys = { {
			"fm",
			vim.cmd.GuardFmt,
		} },
	},
	-- AUTO CONVERT STRING TEMPLATE
	{
		"chrisgrieser/nvim-puppeteer",
		dependencies = "nvim-treesitter/nvim-treesitter",
		lazy = false, -- plugin lazy-loads itself
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
}
