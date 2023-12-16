return {
	-- MOVE
	{
		"folke/flash.nvim",
		event = "VeryLazy",
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
	-- UNDO TREE
	{ "mbbill/undotree", keys = { { "<leader>u", vim.cmd.UndotreeToggle } } },
	-- SURROUND
	{ "kylechui/nvim-surround", config = true },
	-- ICONS PICKER
	{
		"ziontee113/icon-picker.nvim",
		keys = { { "<leader><leader>y", "<cmd>:IconPickerYank nerd_font<cr>" } },
		dependencies = "stevearc/dressing.nvim",
		config = true,
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
	-- WIN VIEW
	"sunjon/shade.nvim",
	-- SUDO
	"lambdalisue/suda.vim",
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
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
	{
		"NeogitOrg/neogit",
		opts = { kind = "auto" },
		config = true,
		keys = {
			{ "<leader>g", vim.cmd.Neogit },
		},
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
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = "chromium",
			})
			-- refer to `configuration to change defaults`
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
}
