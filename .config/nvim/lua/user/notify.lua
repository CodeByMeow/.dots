local M = {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
}

function M.config()
	local banned_messages = { "No information available" }
	vim.notify = vim.schedule_wrap(function(msg, ...)
		for _, banned in ipairs(banned_messages) do
			if msg == banned then
				return
			end
		end
		return require("notify")(msg, ...)
	end)
	require("notify").setup({
		-- background_colour = "#000000",
		render = "wrapped-compact",
		stages = "slide",
		background_colour = "NotifyBackground",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		max_width = 100,
		max_height = 50,
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T",
		},
		timeout = 5000,
		top_down = true,
		on_open = function() end,
		on_close = function() end,
	})
end

return M
