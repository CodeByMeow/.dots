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
		},
		{
			"<leader>ff",
			function()
				local wrd = vim.fn.expand("<cWORD>")
				require("mini.pick").builtin.grep_live({ pattern = wrd })
			end,
		},
		{
			"<leader><space>",
			function()
				require("mini.pick").builtin.buffers()
			end,
		},
		{
			"<leader>h",
			function()
				require("mini.pick").builtin.help()
			end,
		},
		{
			"<leader>o",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end,
		},
		{
			"um",
			function()
				require("mini.map").toggle()
			end,
		},
		{
			"<leader>cl",
			function()
				require("mini.extra").pickers.hl_groups()
			end,
		},
		{
			"<leader>,",
			function()
				require("mini.extra").pickers.buf_lines()
			end,
		},
		{
			"gj",
			function()
				require("mini.splitjoin").toggle()
			end,
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
	require("mini.pick").setup()
	require("mini.basics").setup()
	require("mini.bufremove").setup()
	require("mini.comment").setup()
	require("mini.cursorword").setup()
	require("mini.surround").setup()
	require("mini.tabline").setup()
	require("mini.trailspace").setup()
	require("mini.align").setup()
	require("mini.extra").setup()
	require("mini.map").setup()
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
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		},
	})
	-- TODO
	require("mini.move").setup({
		mappings = {
			-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
			left = "<M-h>",
			right = "<M-i>",
			down = "<M-n>",
			up = "<M-e>",

			-- Move current line in Normal mode
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
	require("mini.splitjoin").setup()
	require("mini.git").setup()
	require("mini.diff").setup({
		-- Options for how hunks are visualized
		view = {
			style = vim.go.number and "number" or "sign",

			-- Signs used for hunks with 'sign' view
			signs = { add = "▒", change = "▒", delete = "▒" },

			-- Priority of used visualization extmarks
			priority = 199,
		},
		mappings = {},
	})
end

return M
