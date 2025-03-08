---@diagnostic disable: undefined-global, undefined-field
-- Define path constants upfront
local data_path = vim.fn.stdpath("data")
local path_package = data_path .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"

-- Auto-install mini.nvim if not present
if not vim.loop.fs_stat(mini_path) then
	vim.notify("Installing mini.nvim", vim.log.levels.INFO)
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
	local success = vim.fn.system(clone_cmd)
	if success then
		vim.cmd("packadd mini.nvim | helptags ALL")
		vim.notify("Installed mini.nvim", vim.log.levels.INFO)
	else
		vim.notify("Failed to install mini.nvim", vim.log.levels.ERROR)
	end
end

-- Load mini.deps and destructure functions
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Group all basic settings into one function
now(function()
	-- Basic UI settings
	vim.o.termguicolors = true

	-- Initialize basic mini plugins
	local mini_basic_plugins = {
		notify = { config = {} },
		tabline = { config = {} },
		files = {
			config = {
				mappings = {
					go_in = "i",
					go_in_plug = "I",
				},
			},
		},
		basics = { config = {} },
		icons = { config = {} },
	}

	-- Setup basic plugins with their configurations
	for plugin, options in pairs(mini_basic_plugins) do
		require("mini." .. plugin).setup(options.config)
	end

	-- Set notify after loading it
	vim.notify = require("mini.notify").make_notify()
end)

-- Consolidate all standard mini plugins with default setup
later(function()
	-- List of mini plugins with default setup
	local standard_mini_plugins = {
		"ai",
		"align",
		"animate",
		"comment",
		"cursorword",
		"extra",
		"git",
		"pairs",
		"pick",
		"surround",
		"trailspace",
	}

	-- Setup all standard plugins
	for _, plugin in ipairs(standard_mini_plugins) do
		require("mini." .. plugin).setup()
	end

	-- Specialized mini plugin configurations
	local specialized_mini_plugins = {
		move = {
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
		},
		jump2d = { mappings = { start_jumping = "f" } },
		indentscope = {
			symbol = "│",
			options = { try_as_border = true },
		},
		hipatterns = {
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		},
	}

	-- Setup specialized plugins with their configurations
	for plugin, config in pairs(specialized_mini_plugins) do
		require("mini." .. plugin).setup(config)
	end
end)

-- Custom plugins installation and setup
now(function()
	-- Group all custom plugins with their dependencies
	local custom_plugins = {
		{ source = "alexxGmZ/e-ink.nvim" },
		{ source = "ThePrimeagen/harpoon", checkout = "harpoon2", depends = { "nvim-lua/plenary.nvim" } },
		{ source = "aserowy/tmux.nvim" },
		{ source = "dstein64/vim-startuptime" },
		{ source = "folke/which-key.nvim" },
		{ source = "lewis6991/gitsigns.nvim" },
		{ source = "mbbill/undotree" },
		{ source = "nvim-tree/nvim-web-devicons" },
	}

	-- Add all plugins at once
	for _, plugin in ipairs(custom_plugins) do
		add(plugin)
	end

	-- Apply theme
	vim.cmd.colorscheme("e-ink")

	-- Configure which-key
	require("which-key").setup({
		preset = "helix",
		icons = {
			mappings = false,
			breadcrumb = "»",
			separator = "",
			group = "+",
			ellipsis = "…",
		},
		win = { border = "single" },
	})

	-- Configure tmux
	require("tmux").setup({
		copy_sync = { enable = true },
		navigation = { enable_default_keybindings = false },
		resize = { enable_default_keybindings = false },
	})

	-- Configure gitsigns
	require("gitsigns").setup({ current_line_blame = true })
end)

-- Harpoon configuration in its own scope
local function setup_harpoon()
	local harpoon = require("harpoon")
	harpoon.setup()

	local mappings = {
		{
			key = "<leader>pa",
			fn = function()
				harpoon:list():add()
			end,
			desc = "Add to quick menu",
		},
		{
			key = "<leader>pm",
			fn = function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Toggle quick menu",
		},
		{
			key = "<leader>pn",
			fn = function()
				harpoon:list():select(1)
			end,
			desc = "Select first entry in quick menu",
		},
	}

	for _, map in ipairs(mappings) do
		vim.keymap.set("n", map.key, map.fn, { desc = map.desc })
	end
end
setup_harpoon()

-- LSP and completion setup
later(function()
	-- Add suda
	add({ source = "lambdalisue/suda.vim" })

	-- LSP setup
	add({
		source = "neovim/nvim-lspconfig",
		depends = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	})

	-- CMP and its dependencies
	add({
		source = "hrsh7th/nvim-cmp",
		depends = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	-- LuaSnip
	add({
		source = "L3MON4D3/LuaSnip",
		hooks = {
			post_install = function(params)
				vim.notify("Building lua snippets", vim.log.levels.INFO)
				local result = vim.system({ "make", "install_jsregexp" }, { cwd = params.path }):wait()
				local level = result.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR
				local status = result.code == 0 and "done" or "failed"
				vim.notify("Building lua snippets " .. status, level)
			end,
		},
	})

	-- Emmet
	add({
		source = "dcampos/cmp-emmet-vim",
		depends = { "mattn/emmet-vim" },
	})

	-- Codeium
	add({ source = "Exafunction/codeium.nvim", depends = { "nvim-lua/plenary.nvim" } })
	require("codeium").setup()

	-- Folds with UFO
	add({ source = "kevinhwang91/nvim-ufo", depends = { "kevinhwang91/promise-async" } })
	require("ufo").setup({
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	})

	-- CMP configuration
	local function setup_cmp()
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
						return entry:get_kind() ~= 15
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
				return vim.bo.filetype ~= "scss" or vim.fn.getline("."):match("%$") == nil
			end,
		})

		-- Command line completion
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})
	end
	setup_cmp()

	-- LSP setup
	local function setup_lsp()
		local server_names = {
			"ts_ls",
			"lua_ls",
			"cssls",
			"html",
			"jsonls",
			"eslint",
			"emmet_ls",
		}

		-- Setup Mason first
		require("mason").setup({ ui = { border = "single" } })
		require("mason-lspconfig").setup({
			ensure_installed = server_names,
			automatic_installation = true,
		})

		-- LSP common capabilities
		local function common_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			return capabilities
		end

		-- LSP on_attach function with keymaps
		local function on_attach()
			local keymap_opts = { buffer = true, noremap = true, silent = true }

			local lsp_keymaps = {
				{ mode = "n", key = "<leader>ca", fn = vim.lsp.buf.code_action, desc = "LSP Code Actions" },
				{
					mode = "n",
					key = "<leader>r",
					fn = function()
						return ":IncRename " .. vim.fn.expand("<cword>")
					end,
					expr = true,
					desc = "LSP Rename",
				},
				{ mode = "n", key = "gd", fn = vim.lsp.buf.definition, desc = "Go to Definition" },
				{ mode = "n", key = "gD", fn = vim.lsp.buf.declaration, desc = "Go to Declaration" },
				{ mode = "n", key = "gi", fn = vim.lsp.buf.implementation, desc = "Go to Implementation" },
				{ mode = "n", key = "gt", fn = vim.lsp.buf.type_definition, desc = "Go to Type Definition" },
				{ mode = "n", key = "H", fn = vim.lsp.buf.hover, desc = "Hover Documentation" },
				{ mode = "i", key = "<C-k>", fn = vim.lsp.buf.signature_help, desc = "Signature Help" },
				{
					mode = "n",
					key = "gr",
					fn = function()
						if not vim.lsp.buf.references() then
							require("mini.pick").builtin.lsp({ kind = "references" })
						else
							vim.notify("No references found", vim.log.levels.INFO)
						end
					end,
					desc = "LSP References",
				},
			}

			for _, map in ipairs(lsp_keymaps) do
				local opts = vim.tbl_extend("force", keymap_opts, {
					desc = map.desc,
					expr = map.expr,
				})
				vim.keymap.set(map.mode, map.key, map.fn, opts)
			end
		end

		-- Additional LSP plugins
		add({ source = "smjonas/inc-rename.nvim" })
		require("inc_rename").setup()

		add({ source = "folke/trouble.nvim" })
		require("trouble").setup()

		-- Configure LSP servers
		local lspconfig = require("lspconfig")
		local servers = require("mason-lspconfig").get_installed_servers()

		require("lspconfig.ui.windows").default_options.border = "single"

		for _, server in ipairs(servers) do
			local opts = {
				capabilities = common_capabilities(),
				on_attach = on_attach,
			}

			local ok, settings = pcall(require, "lspsettings." .. server)
			if ok then
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

		-- Diagnostic float on cursor move
		vim.api.nvim_create_autocmd("CursorMoved", {
			pattern = "*",
			callback = function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end,
		})
	end
	setup_lsp()

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
					footer_pos = "right",
					show_footer = true,
					relative = "editor",
					style = "minimal",
					width_ratio = 0.6,
					height_ratio = 0.6,
					title_prefix = "󰠭 ",
				},
			},
		},
		ui_select = { enable = true },
	})

	-- Namu keymaps
	vim.keymap.set("n", "<leader>ss", require("namu.namu_symbols").show, {
		desc = "Jump to LSP symbol",
		silent = true,
	})
end)

-- Global keymaps
local function setup_keymaps()
	local keymaps = {
		-- Which-key
		{
			mode = "n",
			key = "<leader>?",
			fn = function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},

		-- File navigation
		{ mode = "n", key = "<leader><leader>", fn = "<cmd>Pick files<cr>", desc = "Pick File" },
		{ mode = "n", key = "<leader>g", fn = "<cmd>Pick grep_live<cr>", desc = "Pick Grep Live" },
		{ mode = "n", key = "<leader>o", fn = "<cmd>Pick oldfiles<cr>", desc = "Pick Old Files" },
		{ mode = "n", key = "<leader>b", fn = "<cmd>Pick buffers<cr>", desc = "Pick Buffers" },
		{ mode = "n", key = "<leader>h", fn = "<cmd>Pick help<cr>", desc = "Pick Help" },
		{ mode = "n", key = "<leader>d", fn = "<cmd>Pick diagnostic<cr>", desc = "Pick Diagnostic" },
		{ mode = "n", key = "<leader>H", fn = "<cmd>Pick hl_groups<cr>", desc = "Highlight" },

		-- Utilities
		{ mode = "n", key = "<leader>e", fn = "<cmd>lua MiniFiles.open()<cr>", desc = "Explorer" },
		{ mode = "n", key = "<leader>ll", fn = "<cmd>lua MiniTrailspace.trim()<cr>", desc = "Trailing Space" },

		-- Trouble
		{ mode = "n", key = "<leader>tt", fn = "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Diagnostics" },
		{
			mode = "n",
			key = "<leader>tT",
			fn = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Toggle Buffer Diagnostics",
		},
		{ mode = "n", key = "<leader>ts", fn = "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Toggle Symbols" },

		-- Folds
		{
			mode = "n",
			key = "zR",
			fn = function()
				require("ufo").openAllFolds()
			end,
			desc = "Open All Folds",
		},
		{
			mode = "n",
			key = "zM",
			fn = function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close All Folds",
		},

		-- Undotree
		{ mode = "n", key = "<leader>u", fn = "<cmd>UndotreeToggle<cr>", desc = "Toggle UndoTree" },

		-- MiniDeps
		{ mode = "n", key = "<leader>U", fn = "<cmd>DepsUpdate<cr>", desc = "Update Dependencies" },
	}

	for _, map in ipairs(keymaps) do
		vim.keymap.set(map.mode, map.key, map.fn, { desc = map.desc })
	end

	-- Tmux navigation keymaps
	local tmux_nav = {
		{ key = "<C-h>", func = "move_left" },
		{ key = "<C-Right>", func = "move_right" },
		{ key = "<C-n>", func = "move_bottom" },
		{ key = "<C-e>", func = "move_top" },
	}

	for _, nav in ipairs(tmux_nav) do
		vim.keymap.set("n", nav.key, function()
			require("tmux")[nav.func]()
		end)
	end
end
setup_keymaps()
