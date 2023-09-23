require("hydrate").setup({
	-- The interval between notifications in minutes
	minute_interval = 30,

	-- The render style for notifications
	-- Accepted values are "default", "minimal", "simple" or "compact"
	render_style = "simple",

	-- Loads time of last drink on startup
	-- Useful if you don't have long-running neovim instances
	-- or if you tend to have multiple instances running at a time
	persist_timer = true,
})
