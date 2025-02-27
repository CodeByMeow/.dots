return {
	"neanias/everforest-nvim",
	enabled = false,
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		local ev = require("everforest")
		ev.setup({
			background = "soft",
			transparent_background_level = 1,
			ui_contrast = "low",
			italics = true,
			dim_active_windows = false,
		})

		ev.load()
	end,
}
