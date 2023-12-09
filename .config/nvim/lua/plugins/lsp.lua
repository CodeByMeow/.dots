return {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	-- AUTOCOMPLETION
	{
		"hrsh7th/nvim-cmp",
		dependencies = {

			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
		},
	},
	-- SNIPPETS
	{
		"L3MON4D3/LuaSnip",
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
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, config = false },
	-- LSPSAGA
	{ "nvimdev/lspsaga.nvim", event = "LspAttach" },
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
	},
}
