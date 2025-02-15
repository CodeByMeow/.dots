return {
	"bassamsdata/namu.nvim",
	config = function()
		require("namu").setup({
			-- Enable the modules you want
			namu_symbols = {
				enable = true,
				options = {}, -- here you can configure namu
			},
			ui_select = { enable = false }, -- vim.ui.select() wrapper
		})
		-- === Suggested Keymaps: ===
		local namu = require("namu.namu_symbols")
		vim.keymap.set("n", "<leader>ss", namu.show, {
			desc = "Jump to LSP symbol",
			silent = true,
		})
	end,
}
