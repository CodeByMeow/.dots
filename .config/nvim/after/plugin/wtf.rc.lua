require("wtf").setup({
	popup_type = "popup",
	openai_api_key = "isk-WzDTV08MeT7L0xeu92eyT3BlbkFJgZ12Rk5dY3VvX2kZ3UoP",
	openai_model_id = "gpt-3.5-turbo",
	language = "english",
	additional_instructions = "Start the reply with 'OH HAI THERE'",
	search_engine = "google",
})

vim.keymap.set("n", "gw", function()
	require("wtf").ai()
end)

vim.keymap.set("n", "<leader>gw", function()
	require("wtf").search()
end)
