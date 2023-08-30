return {
	-- THEMES
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	"tamton-aquib/staline.nvim",
	"mbbill/undotree",
	"mattn/emmet-vim",
	"max397574/better-escape.nvim",
	"akinsho/bufferline.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"folke/zen-mode.nvim",
	"lewis6991/gitsigns.nvim",
	"dinhhuy258/git.nvim",
	"numToStr/Comment.nvim",
	-- Surround
	"kylechui/nvim-surround",
	-- Tmux
	"aserowy/tmux.nvim",
	-- Highlight color
	"brenoprata10/nvim-highlight-colors",
	"kelly-lin/ranger.nvim",
	"ThePrimeagen/harpoon",
	"karb94/neoscroll.nvim",
	"RRethy/vim-illuminate",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
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
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",

			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
			},
			"rafamadriz/friendly-snippets",
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"jghauser/mkdir.nvim",
		build = function()
			require("mkdir")
		end,
		event = "BufWritePre",
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim" },
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	{ "ziontee113/icon-picker.nvim", dependencies = "stevearc/dressing.nvim" },
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		module = "tailwindcss-colors",
		-- run the setup function after plugin is loaded
	},
	-- DAP
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	"sunjon/shade.nvim",
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	{
		"folke/flash.nvim",
		event = "VeryLazy",
	},
	"lambdalisue/suda.vim",
	"nvimdev/guard.nvim",
	{
		"nvim-neorg/neorg",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	},
	{
		"MaximilianLloyd/tw-values.nvim",
		opts = {
			border = "rounded",
			show_unknown_classes = true,
		},
	},
	{
		"bennypowers/nvim-regexplainer",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"MunifTanjim/nui.nvim",
		},
	},
	{ "piersolenski/wtf.nvim", dependencies = {
		"MunifTanjim/nui.nvim",
	}, event = "VeryLazy" },
}
