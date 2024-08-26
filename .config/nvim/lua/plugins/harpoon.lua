return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add to quick menu" })
		vim.keymap.set("n", "<leader>hm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle quick menu" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():select(1)
		end, { desc = "Select first entry in quick menu" })
	end,
}
