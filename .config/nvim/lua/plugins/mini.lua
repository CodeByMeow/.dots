local M = {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	event = { "BufReadPre" },
	keys = {
		{
			"<leader>o",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end,
			desc = "Explorer",
		},
		{
			"<leader>j",
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
	require("mini.extra").setup()
	require("mini.icons").setup()
	require("mini.surround").setup()
	require("mini.tabline").setup()

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
