local kind = require("config.icons").kind
require("lspsaga").setup({
	ui = {
		kind = kind,
		border = "single",
		code_action = " ",
	},
})

local keymap = vim.keymap.set
keymap("n", "gf", "<cmd>Lspsaga finder<CR>")
keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "grp", "<cmd>Lspsaga rename ++project<CR>")
keymap("n", "gt", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap("n", "sd", "<cmd>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "<leader>j", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<leader>k", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
keymap("n", "<S-h>", "<cmd>Lspsaga hover_doc<CR>")
keymap({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<CR>")
