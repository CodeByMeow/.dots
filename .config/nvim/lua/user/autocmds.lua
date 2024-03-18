local kind = require("user.icons").diagnostics
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"oil",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = false
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		local status_ok, luasnip = pcall(require, "luasnip")
		if not status_ok then
			return
		end
		if luasnip.expand_or_jumpable() then
			vim.cmd([[silent! lua require("luasnip").unlink_current()]])
		end
	end,
})

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "single",
		source = "always",
		header = "",
		prefix = "",
	},
})

local ns = vim.api.nvim_create_namespace("CurlineDiag")
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = args.buf,
			callback = function()
				pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
				local hi = { "Error", "Warn", "Info", "Hint" }
				local curline = vim.api.nvim_win_get_cursor(0)[1]
				local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
				local virt_texts = { { (" "):rep(4) } }
				for _, diag in ipairs(diagnostics) do
					virt_texts[#virt_texts + 1] =
						{ kind[hi[diag.severity]] .. diag.message, "DiagnosticVirtualText" .. hi[diag.severity] }
				end
				vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
					virt_text = virt_texts,
					hl_mode = "combine",
				})
			end,
		})
	end,
})
