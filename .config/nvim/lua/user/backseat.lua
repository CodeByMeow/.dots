local M = {
	"james1236/backseat.nvim",
}
function M.config()
	require("backseat").setup({
		openai_api_key = vim.env.OPENAI_API_KEY,
		openai_model_id = "gpt-3.5-turbo",
	})
end

return M
