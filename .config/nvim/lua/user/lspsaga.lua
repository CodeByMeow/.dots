local M = {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	keys = {
		{ "gf", "<cmd>Lspsaga finder<CR>" },
		{ "gr", "<cmd>Lspsaga rename<CR>" },
		{ "grp", "<cmd>Lspsaga rename ++project<CR>" },
		{ "gt", "<cmd>Lspsaga peek_definition<CR>" },
		{ "gd", "<cmd>Lspsaga goto_definition<CR>" },
		{ "sd", "<cmd>Lspsaga show_buf_diagnostics<CR>" },
		{
			"<leader>n",
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
		},
		{
			"<leader>e",
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
		},
		{ "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
		{ "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
		{ "H", "<cmd>Lspsaga hover_doc<CR>" },
		{ "ga", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" } },
		{ "go", "<cmd>Lspsaga outline<CR>", mode = { "n", "v" } },
		{ "<leader>t", "<cmd>Lspsaga term_toggle<CR>", mode = { "n", "t" } },
	},
}

function M.config()
	local kind = require("user.icons").kind
	require("lspsaga").setup({
		ui = {
			kind = kind,
			border = "rounded",
			code_action = "󰫣 ",
		},
		beacon = {
			enable = true,
		},
		diagnostic = {
			max_height = 0.8,
			keys = {
				quit = { "q", "<ESC>" },
			},
			show_layout = "float",
			diagnostic_only_current = false,
		},
	})
end

return M
