return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
		vim.keymap.set("n", "ha", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "hm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "hn", function()
			harpoon:list():select(1)
		end)
	end,
}
