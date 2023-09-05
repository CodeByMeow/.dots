local ft = require("guard.filetype")

-- use stylua to format lua files and no linter
ft("lua"):fmt("stylua")

ft("typescript,javascript,typescriptreact"):fmt("prettier")
ft("html, css, json"):fmt("prettier")

-- call setup LAST
require("guard").setup({
	-- the only option for the setup function
	fmt_on_save = false,
	lsp_as_default_formatter = true,
})

vim.keymap.set({ "n", "v" }, "fm", "<cmd>GuardFmt<CR>")
