local M = { "mistricky/codesnap.nvim", build = "make" }

local current_time = os.date("%Y-%m-%d_%H-%M-%S")

function M.config()
	require("codesnap").setup({
		mac_window_bar = true,
		title = current_time,
		code_font_family = "Iosevka Ori Sans",
		watermark_font_family = "Pacifico",
		watermark = "",
		bg_theme = "default",
		breadcrumbs_separator = "/",
		has_breadcrumbs = false,
		save_path = "~/Pictures/ScreenShot/" .. current_time .. ".png",
	})
end

return M
