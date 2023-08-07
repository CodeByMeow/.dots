local kind = require("7ColorsCat.config").icons.kind

require("lspsaga").setup({
	ui = {
		kind = kind,
	},
})

local keymap = vim.keymap.set

keymap("n", "gf", "<cmd>Lspsaga finder<CR>")

-- Code action
keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "grp", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_definition<CR>")

-- Go to Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show buffer diagnostic
keymap("n", "sd", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "<leader>j", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<leader>k", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toglle Outline
keymap("n", "<Leader>o", "<cmd>Lspsaga outline<CR>")
-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
-- Hover Doc
keymap("n", "<S-h>", "<cmd>Lspsaga hover_doc<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<CR>")
