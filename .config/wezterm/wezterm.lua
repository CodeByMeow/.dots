local wezterm = require("wezterm")
local colors = require("everforest-dark-medium")

return {
	colors = colors,
	font = wezterm.font("Iosevka IBM"),
	font_size = 15.5,
	window_background_opacity = 1.0,
	text_background_opacity = 1.0,
	enable_tab_bar = false,
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	window_padding = { left = "1cell", right = "1cell", top = "0.5cell", bottom = "0.5cell" },
	disable_default_key_bindings = true,
	window_decorations = "NONE",
}


