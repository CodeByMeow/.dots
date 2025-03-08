---@diagnostic disable: undefined-global, undefined-field
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"

-- Automatically install mini.nvim if not present
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Load mini.deps
require("mini.deps").setup({ path = { package = path_package } })

-- Destructure mini.deps functions
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Immediately executed setup functions
now(function()
	-- UI and basic settings
	vim.o.termguicolors = true

	-- Mini plugin basic setups
	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()
	require("mini.tabline").setup()

	-- Mini files configuration
	require("mini.files").setup({
		mappings = {
			go_in = "i",
			go_in_plug = "I",
		},
	})

	require("mini.basics").setup()
	require("mini.icons").setup()
end)

-- Delayed plugin setups
later(function()
	local mini_plugins = {
		"mini.ai",
		"mini.align",
		"mini.animate",
		"mini.comment",
		"mini.cursorword",
		"mini.extra",
		"mini.git",
		"mini.pairs",
		"mini.pick",
		"mini.surround",
	}

	for _, plugin in ipairs(mini_plugins) do
		require(plugin).setup()
	end

	-- Specific configurations for some plugins
	require("mini.move").setup({
		mappings = {
			left = "<M-h>",
			right = "<M-i>",
			down = "<M-n>",
			up = "<M-e>",
			line_left = "<M-h>",
			line_right = "<M-i>",
			line_down = "<M-n>",
			line_up = "<M-e>",
		},
	})

	require("mini.jump2d").setup({ mappings = { start_jumping = "f" } })
	require("mini.indentscope").setup({
		symbol = "│",
		options = { try_as_border = true },
	})
end)

-- Custom plugins and their configurations
now(function()
	local custom_plugins = {
		{ source = "folke/which-key.nvim" },
		{ source = "aserowy/tmux.nvim" },
		{ source = "lewis6991/gitsigns.nvim" },
		{ source = "dstein64/vim-startuptime" },
		{ source = "alexxGmZ/e-ink.nvim" },
		{ source = "mbbill/undotree" },
		{ source = "ThePrimeagen/harpoon", checkout = "harpoon2", depends = { "nvim-lua/plenary.nvim" } },
		{ source = "nvim-tree/nvim-web-devicons" },
	}

	for _, plugin in ipairs(custom_plugins) do
		add(plugin)
	end

	-- Theme
	vim.cmd.colorscheme("e-ink")

	-- Which-key configuration
	require("which-key").setup({
		preset = "helix",
		icons = {
			mappings = false,
			breadcrumb = "»",
			separator = "",
			group = "+",
			ellipsis = "…",
		},
		win = {
			border = "single",
		},
	})

	-- Tmux configuration
	require("tmux").setup({
		copy_sync = { enable = true },
		navigation = { enable_default_keybindings = false },
		resize = { enable_default_keybindings = false },
	})

	-- Gitsigns configuration
	require("gitsigns").setup({ current_line_blame = true })
end)

-- Harpoon configuration
local harpoon = require("harpoon")
harpoon.setup()
vim.keymap.set("n", "<leader>pa", function()
	harpoon:list():add()
end, { desc = "Add to quick menu" })
vim.keymap.set("n", "<leader>pm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle quick menu" })
vim.keymap.set("n", "<leader>pn", function()
	harpoon:list():select(1)
end, { desc = "Select first entry in quick menu" })

later(function()
	-- Additional plugins
	add({ source = "lambdalisue/suda.vim" })

	add({ source = "brenoprata10/nvim-highlight-colors" })
	require("nvim-highlight-colors").setup()

	-- LSP
	add({
		source = "neovim/nvim-lspconfig",
		depends = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	})

	-- CMP
	add({
		source = "hrsh7th/nvim-cmp",
		depends = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	add({
		source = "dcampos/cmp-emmet-vim",
		depends = { "mattn/emmet-vim" },
	})

	add({ source = "Exafunction/codeium.nvim", depends = { "nvim-lua/plenary.nvim" } })
	require("codeium").setup()

	-- Folds
	add({ source = "kevinhwang91/nvim-ufo", depends = { "kevinhwang91/promise-async" } })
	require("ufo").setup({
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	})

	-- CMP configuration
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
			{
				name = "nvim_lsp",
				entry_filter = function(entry)
					if entry:get_kind() == 15 then
						return false
					end
					return true
				end,
			},
			{ name = "nvim_lsp_signature_help" },
			{ name = "codeium" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "tabnine" },
			{ name = "emmet_vim" },
		}),
		enabled = function()
			local filetype = vim.bo.filetype
			if filetype == "scss" then
				return vim.fn.getline("."):match("%$") == nil
			end
			return true
		end,
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	local server_names = {
		"ts_ls",
		"lua_ls",
		"cssls",
		"html",
		"jsonls",
		"eslint",
		"emmet_ls",
	}

	require("mason").setup({ ui = { border = "single" } })
	require("mason-lspconfig").setup({
		ensure_installed = server_names,
		automatic_installation = true,
	})

	-- LSP setup helpers
	local function common_capabilities()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end

	local function on_attach()
		local opts = { buffer = bufnr, noremap = true, silent = true }
		-- Code Actions
		vim.keymap.set(
			"n",
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "LSP Code Actions" })
		)

		-- Rename
		vim.keymap.set("n", "<leader>r", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true, desc = "LSP Rename" })

		-- Jump to Definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))

		-- Jump to Declaration
		vim.keymap.set(
			"n",
			"gD",
			vim.lsp.buf.declaration,
			vim.tbl_extend("force", opts, { desc = "Go to Declaration" })
		)

		-- Jump to Implementation
		vim.keymap.set(
			"n",
			"gi",
			vim.lsp.buf.implementation,
			vim.tbl_extend("force", opts, { desc = "Go to Implementation" })
		)

		-- Show Type Definition
		vim.keymap.set(
			"n",
			"gt",
			vim.lsp.buf.type_definition,
			vim.tbl_extend("force", opts, { desc = "Go to Type Definition" })
		)
		-- Hover Documentation
		vim.keymap.set("n", "H", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))

		-- Signature Help
		vim.keymap.set(
			"i",
			"<C-k>",
			vim.lsp.buf.signature_help,
			vim.tbl_extend("force", opts, { desc = "Signature Help" })
		)

		-- Show References
		vim.keymap.set("n", "gr", function()
			local locations = vim.lsp.buf.references()
			if locations and #locations > 0 then
				require("mini.pick").builtin.lsp({ kind = "references" })
			else
				vim.notify("No references found", vim.log.levels.INFO)
			end
		end, vim.tbl_extend("force", opts, { desc = "LSP References" }))
	end

	add({ source = "smjonas/inc-rename.nvim" })
	require("inc_rename").setup()

	add({ source = "folke/trouble.nvim" })
	require("trouble").setup()

	-- Configure LSP servers
	local lspconfig = require("lspconfig")
	local servers = require("mason-lspconfig").get_installed_servers()

	require("lspconfig.ui.windows").default_options.border = "single"
	for _, server in ipairs(servers) do
		local capabilities = common_capabilities()
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		local require_ok, settings = pcall(require, "lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		lspconfig[server].setup(opts)
	end

	-- Diagnostic configuration
	vim.diagnostic.config({
		virtual_lines = true,
		virtual_text = false,
		severity_sort = true,
	})

	-- Show diagnostic float on cursor move
	vim.api.nvim_create_autocmd("CursorMoved", {
		pattern = "*",
		callback = function()
			vim.diagnostic.open_float(nil, { focusable = false })
		end,
	})
	-- Formatting configuration
	add({ source = "stevearc/conform.nvim" })
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			sh = { "beautysh" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
	})

	-- Treesitter configuration
	add({
		source = "nvim-treesitter/nvim-treesitter",
		checkout = "master",
		monitor = "main",
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
		depends = {
			"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
			"windwp/nvim-ts-autotag",
		},
	})

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
			"java",
			"xml",
			"http",
			"graphql",
			"vimdoc",
		},
		auto_install = true,
		highlight = { enable = true },
		rainbow = { enable = true, disable = { "html" } },
		autotag = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true, disable = { "yaml" } },
		ignore_install = { "help" },
	})

	-- LSP end hints
	add({ source = "chrisgrieser/nvim-lsp-endhints" })
	require("lsp-endhints").setup()

	-- Namu
	add({ source = "bassamsdata/namu.nvim" })

	require("namu").setup({
		-- Enable the modules you want
		namu_symbols = {
			enable = true,
			options = {
				window = {
					auto_size = true,
					min_height = 1,
					min_width = 20,
					max_width = 120,
					max_height = 30,
					padding = 2,
					border = "single",
					title_pos = "left",
					show_footer = true,
					footer_pos = "right",
					relative = "editor",
					style = "minimal",
					width_ratio = 0.6,
					height_ratio = 0.6,
					title_prefix = "󰠭 ",
				},
			},
		},
		ui_select = { enable = true }, -- vim.ui.select() wrapper
	})

	-- === Suggested Keymaps: ===
	local namu = require("namu.namu_symbols")
	vim.keymap.set("n", "<leader>ss", namu.show, {
		desc = "Jump to LSP symbol",
		silent = true,
	})
end)

-- Keymaps
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

vim.keymap.set("n", "<leader><leader>", "<cmd>Pick files<cr>", { desc = "Mini Pick File" })
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep_live<cr>", { desc = "Mini Pick Grep Live" })
vim.keymap.set("n", "<leader>o", "<cmd>Pick oldfiles<cr>", { desc = "Mini Pick Old Files" })
vim.keymap.set("n", "<leader>b", "<cmd>Pick buffers<cr>", { desc = "Mini Pick Buffers" })
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<cr>", { desc = "Mini Pick Help" })
vim.keymap.set("n", "<leader>d", "<cmd>Pick diagnostic<cr>", { desc = "Mini Pick Diagnostic" })
vim.keymap.set("n", "<leader>H", "<cmd>Pick hl_groups<cr>", { desc = "Mini Highlight" })
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { desc = "Mini Explorer" })

-- Tmux navigation keymaps
local tmux_navigation = {
	{ key = "<C-h>", func = "move_left" },
	{ key = "<C-Right>", func = "move_right" },
	{ key = "<C-n>", func = "move_bottom" },
	{ key = "<C-e>", func = "move_top" },
}

for _, nav in ipairs(tmux_navigation) do
	vim.keymap.set("n", nav.key, function()
		require("tmux")[nav.func]()
	end)
end

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>tT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>")

-- Folds
vim.keymap.set("n", "zR", function()
	require("ufo").openAllFolds()
end)
vim.keymap.set("n", "zM", function()
	require("ufo").closeAllFolds()
end)

-- Undotree
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })

-- MiniDeps
vim.keymap.set("n", "<leader>U", "<cmd>DepsUpdate<cr>", { desc = "Update Dependencies" })
