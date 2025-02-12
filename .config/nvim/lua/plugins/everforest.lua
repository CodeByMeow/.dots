return {
	"neanias/everforest-nvim",
	versoir = false,
	lazy = false,
	priority = 1000,
	config = function()
		local ev = require("everforest")
		ev.setup({
			transparent_background_level = 1,
			ui_contrast = "high",
			italics = true,
			dim_active_windows = true,
		})

		ev.load()
	end,
}
