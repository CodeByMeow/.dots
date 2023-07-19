local ft = require("guard.filetype")

-- use stylua to format lua files and no linter
ft("lua"):fmt("stylua")

ft("javascript"):fmt("lsp"):append("prettier")
ft("javascriptreact"):fmt("lsp"):append("prettier")
ft("typescript"):fmt("lsp"):append("prettier")
ft("typescriptreact"):fmt("lsp"):append("prettier")

-- prettier
ft("html"):fmt("prettier")
ft("css"):fmt("prettier")

-- call setup LAST
require("guard").setup({
	-- the only option for the setup function
	fmt_on_save = true,
})

vim.keymap.set({ "n", "v" }, "fm", "<cmd>GuardFmt<CR>")
