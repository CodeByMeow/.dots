local ts = require("nvim-treesitter.configs")

ts.setup({
	ensure_installed = {
		"help",
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
		"norg",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
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
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["ae"] = "@block.outer",
				["ie"] = "@block.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["is"] = "@statement.inner",
				["as"] = "@statement.outer",
				["ad"] = "@comment.outer",
				["am"] = "@call.outer",
				["im"] = "@call.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sn"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>sp"] = "@parameter.inner",
			},
		},
	},
	ignore_install = { "help" },
})

vim.keymap.set("n", "<leader>p", "<cmd>:TSPlaygroundToggle<cr>", { noremap = true, silent = true })
