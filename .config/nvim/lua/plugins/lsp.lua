return {
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
	-- LSP SUPPORT
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, config = false },
	-- LSPSAGA
	{ "nvimdev/lspsaga.nvim", event = "LspAttach" },
}
