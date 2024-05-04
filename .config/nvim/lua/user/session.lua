local M = {
	"rmagatti/auto-session",
}

function M.config()
	require("auto-session").setup({
		log_level = "error",
		auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		auto_session_enable_last_session = true,
	})
end

return M
