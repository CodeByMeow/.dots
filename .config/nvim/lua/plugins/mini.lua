local M = {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	event = { "BufReadPre" },
	keys = {
		{
			"<leader>f",
			function()
				require("mini.pick").builtin.files()
			end,
			desc = "Find File",
		},
		{
			"<leader>mg",
			function()
				local wrd = vim.fn.expand("<cWORD>")
				require("mini.pick").builtin.grep_live({ pattern = wrd })
			end,
			desc = "Live Grep File",
		},
		{
			"<leader>mb",
			function()
				require("mini.pick").builtin.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>mp",
			function()
				require("mini.pick").builtin.help()
			end,
			desc = "Helps",
		},
		{
			"<leader>o",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end,
			desc = "Explorer",
		},
		{
			"<leader>mm",
			function()
				require("mini.map").toggle()
			end,
			desc = "Minimap",
		},
		{
			"<leader>mh",
			function()
				require("mini.extra").pickers.hl_groups()
			end,
			desc = "Highlights",
		},
		{
			"<leader>,",
			function()
				require("mini.extra").pickers.buf_lines()
			end,
			desc = "Jump to line",
		},
		{
			"gj",
			function()
				require("mini.splitjoin").toggle()
			end,
			desc = "Toggle SplitJoin",
		},
		{
			"<leader>mt",
			function()
				require("mini.trailspace").trim()
			end,
			desc = "Trim all trailspace",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}

function M.config()
	require("mini.align").setup()
	require("mini.basics").setup()
	require("mini.bufremove").setup()
	require("mini.comment").setup({
		mappings = {
			comment_line = "<C-_>",
		},
	})
	require("mini.cursorword").setup()
	require("mini.extra").setup()
	require("mini.icons").setup()
	require("mini.map").setup()
	require("mini.surround").setup()
	require("mini.tabline").setup()
	require("mini.trailspace").setup()
	require("mini.pick").setup()

	-- Override
	require("mini.indentscope").setup({
		symbol = "│",
		options = { try_as_border = true },
	})
	require("mini.files").setup({
		content = {
			filter = function(fs_entry)
				if fs_entry.fs_type == "directory" and fs_entry.name == "node_modules" then
					return false
				end

				return true
			end,
		},
		mappings = {
			go_in = "i",
			go_in_plus = "I",
			synchronize = "<leader>w",
		},
	})
	require("mini.hipatterns").setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		},
	})
	require("mini.move").setup({
		mappings = {
			left = "<M-h>",
			right = "<M-i>",
			down = "<M-n>",
			up = "<M-e>",

			line_left = "<M-h>",
			line_right = "<M-i>",
			line_up = "<M-u>",
			line_down = "<M-d>",
		},
	})
	require("mini.animate").setup({
		scroll = {
			enable = true,
		},
	})
	require("mini.diff").setup({
		view = {
			style = vim.go.number and "number" or "sign",
			signs = { add = "▒", change = "▒", delete = "▒" },
			priority = 199,
		},
		mappings = {},
	})
end

return M
