local noice = require("noice")
local icons = require("nvim-nonicons")
noice.setup({
	cmdline = {
		format = {
			cmdline = { icon = "↪️ " },
			search_down = { icon = " ▼ " },
			search_up = { icon = " ▲" },
			filter = { icon = " " },
			lua = { icon = icons.get("lua") },
			help = { icon = " " },
		},
	},

	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		signature = {
			enabled = true,
			auto_open = {
				enabled = true,
				trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
				throttle = 50, -- Debounce lsp signature help request by 50ms
			},
		},
		progress = {
			enabled = true,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			throttle = 1000 / 30, -- frequency to update lsp progress message
			view = "mini",
		},
		hover = {
			enabled = true,
			silent = false, -- set to true to not show a message if hover is not available
			view = nil, -- when nil, use defaults from documentation
			opts = {}, -- merged with defaults from documentation
		},
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
	},
	views = {
		cmdline_popup = {
			border = {
				style = "rounded",
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
	},
})

local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")
require("notify").setup({
	icons = nonicons_extention.icons,
	background_colour = "#000000",
})

vim.keymap.set("n", "<leader>nl", function()
	noice.cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
	noice.cmd("history")
end)
