local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[     █  █     ]],
		[[     ██ ██     ]],
		[[     █████     ]],
		[[     ██ ███     ]],
		[[     █  █     ]],
		[[]],
		[[N  E  O   V  I  M]],
	}

	vim.api.nvim_set_hl(0, "GreenF", {
		fg = "#A9B665",
		bg = nil,
	})
	vim.api.nvim_set_hl(0, "BlueF", {
		fg = "#7DAEA3",
		bg = nil,
	})
	vim.api.nvim_set_hl(0, "GreenFBlueB", {
		fg = "#A9B665",
		bg = "#7DAEA3",
	})
	dashboard.section.header.opts.hl = {
		{ { "BlueF", 5, 7 }, { "GreenF", 8, 22 } },
		{ { "BlueF", 5, 8 }, { "GreenFBlueB", 8, 11 }, { "GreenF", 9, 24 } },
		{ { "BlueF", 5, 10 }, { "GreenF", 10, 12 }, { "GreenF", 12, 26 } },
		{ { "BlueF", 5, 11 }, { "GreenF", 12, 24 } },
		{ { "BlueF", 5, 11 }, { "GreenF", 12, 22 } },
		{ { "BlueF", 5, 11 }, { "GreenF", 12, 22 } },
		{ { "BlueF", 0, 9 }, { "GreenF", 9, 18 } },
	}
	dashboard.section.buttons.val = {
		dashboard.button("f", "󰀶 " .. " Find file", ":Pick files<CR>"),
		dashboard.button("o", " " .. " Files Manager", ":lua MiniFiles.open()<CR>"),
		dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
		dashboard.button("q", "󰩈 " .. " Quit", ":qa<CR>"),
	}
	dashboard.opts.layout[1].val = 6

	require("alpha").setup(dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		callback = function()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100) / 100
			local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
			local plugin = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
			local footer = version .. "\t" .. plugin .. "\n"
			dashboard.section.footer.val = footer
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function()
			vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
		end,
	})
end

return M
