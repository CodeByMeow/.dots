return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank nerd_font<cr>", opts) --> Yank the selected icon into register
	end,
}
