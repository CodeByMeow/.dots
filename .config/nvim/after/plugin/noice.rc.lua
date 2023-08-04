local noice = require("noice")
noice.setup({
	cmdline = {
		format = {
			cmdline = { icon = " " },
			search_down = { icon = "🔍⌄" },
			search_up = { icon = "🔍⌃" },
			filter = { icon = " " },
			lua = { icon = "☾" },
			help = { icon = "?" },
		},
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
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
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
	},
})

require("notify").setup({
	background_colour = "#000000",
})

vim.keymap.set("n", "<leader>nl", function()
	noice.cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
	noice.cmd("history")
end)

vim.keymap.set("n", "<leader>nt", "<CMD>:Noice telescope<CR>")
local noice = require("noice")
noice.setup({
	cmdline = {
		format = {
			cmdline = { icon = " " },
			search_down = { icon = "🔍⌄" },
			search_up = { icon = "🔍⌃" },
			filter = { icon = " " },
			lua = { icon = "☾" },
			help = { icon = "?" },
		},
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
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
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
	},
})

require("notify").setup({
	background_colour = "#000000",
})

vim.keymap.set("n", "<leader>nl", function()
	noice.cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
	noice.cmd("history")
end)

vim.keymap.set("n", "<leader>nt", "<CMD>:Noice telescope<CR>")
