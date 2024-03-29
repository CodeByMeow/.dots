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
		{ "<leader>n", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
		{ "<leader>e", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
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
			border = "single",
			code_action = " ",
		},
		beacon = {
			enable = true,
		},
	})
end

return M
