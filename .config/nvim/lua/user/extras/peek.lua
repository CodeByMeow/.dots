local M = {
	"toppair/peek.nvim",
	event = { "BufReadPre", "BufNewFile" },
	build = "deno task --quiet build:fast",
}

function M.config()
	require("peek").setup({
		app = "browser",
	})
	vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
	vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end

return M
