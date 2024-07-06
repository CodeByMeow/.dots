return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
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
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
	keys = {
		{ "<leader>p", vim.cmd.TSPlaygroundToggle },
	},
	opts = {
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
				swap_next = { ["<leader>a"] = "@parameter.inner" },
				swap_previous = { ["<leader>A"] = "@parameter.inner" },
			},
		},
		ignore_install = { "help" },
	},
}
