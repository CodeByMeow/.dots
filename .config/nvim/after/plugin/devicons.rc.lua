require("nvim-web-devicons").setup({
	color_icons = true,
	default = true,
	strict = true,
	override = {
		deb = { icon = "", name = "Deb" },
		lock = { icon = "", name = "Lock" },
		mp3 = { icon = "", name = "Mp3" },
		mp4 = { icon = "", name = "Mp4" },
		out = { icon = "", name = "Out" },
		["robots.txt"] = { icon = "🕷️", name = "Robots" },
		ttf = { icon = "", name = "TrueTypeFont" },
		rpm = { icon = "", name = "Rpm" },
		woff = { icon = "", name = "WebOpenFontFormat" },
		woff2 = { icon = "", name = "WebOpenFontFormat2" },
		xz = { icon = "", name = "Xz" },
		zip = { icon = "", name = "Zip" },
	},
	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
		["readme.md"] = {
			icon = "",
			color = "#3789CB",
			name = "Readme",
		},
	},
	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
		["js"] = {
			icon = "",
			color = "#F0DB4F",
			name = "JavaScript",
		},
		["php"] = {
			icon = "",
			color = "#6181B6",
			name = "PHP",
		},
		["svg"] = {
			icon = "",
			color = "#F79400",
			name = "SVG",
		},
	},
})
