return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	keys = {
		{ "tf", "<cmd>Lspsaga finder<CR>", desc = "LSPSaga Finder" },
		{ "tr", "<cmd>Lspsaga rename<CR>", desc = "LSPSaga Rename" },
		{ "tp", "<cmd>Lspsaga peek_definition<CR>", desc = "LSPSaga Peek" },
		{ "td", "<cmd>Lspsaga goto_definition<CR>", desc = "LSPSaga Goto Definition" },
		{ "sd", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "LSPSaga Show Buffer Diagnostics" },
		{
			"<leader>n",
			function()
				require("lspsaga.diagnostic"):goto_next()
			end,
			desc = "LSPSaga Go To Next diagnostic",
		},
		{
			"<leader>e",
			function()
				require("lspsaga.diagnostic"):goto_prev()
			end,
			desc = "LSPSaga Go To Previous diagnostic",
		},
		{ "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "LSPSaga Incoming Calls" },
		{ "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "LSPSaga Outgoing Calls" },
		{ "H", "<cmd>Lspsaga hover_doc<CR>", desc = "LSPSaga Hover Doc" },
		{ "ta", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "LSPSaga Code Action" },
		{ "to", "<cmd>Lspsaga outline<CR>", mode = { "n", "v" }, desc = "LSPSaga Outline" },
	},

	config = function()
		local kind = require("config.icons").kind
		require("lspsaga").setup({
			ui = {
				kind = kind,
				border = "rounded",
				code_action = " ",
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
	end,
}
