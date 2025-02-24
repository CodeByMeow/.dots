return {
	"bassamsdata/namu.nvim",
	config = function()
		require("namu").setup({
			-- Enable the modules you want
			namu_symbols = {
				enable = true,
				options = {
					window = {
						auto_size = true,
						min_height = 1,
						min_width = 20,
						max_width = 120,
						max_height = 30,
						padding = 2,
						border = "rounded",
						title_pos = "left",
						show_footer = true,
						footer_pos = "right",
						relative = "editor",
						style = "minimal",
						width_ratio = 0.6,
						height_ratio = 0.6,
						title_prefix = "󰠭 ",
					},
				},
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
