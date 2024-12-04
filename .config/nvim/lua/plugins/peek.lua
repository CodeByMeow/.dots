return {
	"toppair/peek.nvim",
	event = { "BufReadPre", "BufNewFile" },
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup({
			app = "browser",
		})
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
}
