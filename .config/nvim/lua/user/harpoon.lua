local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
}

function M.config()
	---@diagnostic disable-next-line: missing-parameter
	local harpoon2 = require("harpoon"):setup()
	vim.keymap.set("n", "ha", function()
		harpoon2:list():append()
	end)
	vim.keymap.set("n", "hm", function()
		harpoon2.ui:toggle_quick_menu(harpoon2:list())
	end)
	vim.keymap.set("n", "hn", function()
		harpoon2:list():next()
	end)
	vim.keymap.set("n", "he", function()
		harpoon2:list():prev()
	end)
end

return M
