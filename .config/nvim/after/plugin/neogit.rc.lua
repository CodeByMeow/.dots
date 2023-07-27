local neogit = require("neogit")

neogit.setup({
	kind = "split",
})

vim.keymap.set("n", "<leader>g", "<cmd>:Neogit<cr>")
