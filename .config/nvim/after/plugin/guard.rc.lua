local ft = require("guard.filetype")

ft("lua"):fmt("stylua")

ft("html, css, json,typescript,javascript,typescriptreact,yaml"):fmt("prettier")

-- call setup LAST
require("guard").setup({
	-- the only option for the setup function
	fmt_on_save = true,
	lsp_as_default_formatter = true,
})

vim.keymap.set({ "n", "v" }, "fm", "<cmd>GuardFmt<CR>")
