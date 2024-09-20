local wezterm = require("wezterm")

return {
	color_scheme = "cyberdream",
	font = wezterm.font("Iosevka IBM"),
	font_size = 15.5,
	window_background_opacity = 0.65,
	text_background_opacity = 1.0,
	enable_tab_bar = false,
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0.5cell",
		bottom = "0.5cell",
	},
}
