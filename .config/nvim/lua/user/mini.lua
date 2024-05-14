local M = {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	event = { "BufReadPre" },
	keys = {
		{
			"<leader>f",
			function()
				vim.cmd("Pick files")
			end,
		},
		{
			"<leader>ff",
			function()
				vim.cmd("Pick grep_live")
			end,
		},
		{
			"<leader>b",
			function()
				vim.cmd("Pick buffers")
			end,
		},
		{
			"<leader>h",
			function()
				vim.cmd("Pick help")
			end,
		},
		{
			"<leader>o",
			function()
				vim.cmd(":lua MiniFiles.open()")
			end,
		},
		{
			"ha",
			function()
				vim.cmd(":lua MiniVisits.add_path()")
			end,
		},
		{
			"hm",
			function()
				vim.cmd(":lua MiniVisits.select_path()")
			end,
		},
		{
			"hd",
			function()
				vim.cmd(":lua MiniVisits.remove_path()")
			end,
		},
		{
			"um",
			function()
				require("mini.map").toggle()
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
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "TSDanger" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "TSWarning" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "TSTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "TSNote" },
		},
	})
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
	require("mini.visits").setup({})
	require("mini.map").setup({})
end

return M
