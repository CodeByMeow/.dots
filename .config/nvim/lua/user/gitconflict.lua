local M = { "akinsho/git-conflict.nvim", version = "*" }

function M.config()
	vim.keymap.set("n", "cf", "<CMD>GitConflictListQf<CR>")
end

return M
