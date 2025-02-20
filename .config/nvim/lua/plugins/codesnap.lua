return {
	"mistricky/codesnap.nvim",
	build = "make",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
	},
	opts = {
		save_path = "~/Pictures",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
		code_font_family = "Iosevka IBM",
		watermark_font_family = "Pacifico",
		watermark = "Bigherodev",
	},
}
