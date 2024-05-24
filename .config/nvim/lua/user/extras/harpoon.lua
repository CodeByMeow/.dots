local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	local harpoon = require("harpoon")
	harpoon.setup()
	vim.keymap.set("n", "ha", function()
		harpoon:list():add()
	end)
	vim.keymap.set("n", "hm", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end)
end

return M
