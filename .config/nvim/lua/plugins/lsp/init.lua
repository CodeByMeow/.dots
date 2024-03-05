local lsp_zero = require("lsp-zero")
local icons    = require("lib.icons")

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- LSP MANAGER
require("mason").setup({
	ui = {
		border = "single"
	}
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"cssls",
		"html",
		"intelephense",
		"jsonls",
		"eslint",
		"prismals",
		"tailwindcss",
		"emmet_ls"
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

lsp_zero.set_sign_icons({
	error = icons.diagnostics.Error,
	warn = icons.diagnostics.Warn,
	hint = icons.diagnostics.Hint,
	info = icons.diagnostics.Info,
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

-- CMP
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local default_cmp_sources = cmp.config.sources({
	{
		name = "nvim_lsp",
		entry_filter = function(entry)
			if entry:get_kind() == 15 then
				return false
			end
			return true
		end,
	},
	{ name = "nvim_lua" },
	{ name = "buffer",    keyword_length = 3 },
	{ name = "luasnip",   keyword_length = 2 },
	{ name = "path" },
	{ name = "treesitter" },
	{ name = "calc" },
	{ name = "emmet_vim" },
})

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp_action.toggle_completion(),
		["<Tab>"] = cmp_action.tab_complete(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<C-f>"] = cmp.mapping.scroll_docs(5),
		["<C-u>"] = cmp.mapping.scroll_docs(-5),
	}),
	entry_filter = function(entry, context)
		local kind = entry:get_kind()
		local line = context.cursor_line
		local col = context.cursor.col
		local char_before_cursor = string.sub(line, col - 1, col - 1)
		if char_before_cursor == "." then
			if kind == 2 or kind == 5 then
				return true
			else
				return false
			end
		elseif string.match(line, "^%s*%w*$") then
			if kind == 3 or kind == 6 then
				return true
			else
				return false
			end
		end
		return true
	end,
	formatting = {
		format = function(entry, vim_item)
			local custom_menu_icon = {}
			local source_icons = { calc = " 󰃬 ", codeium = " " }
			for key, value in pairs(icons.kind) do
				custom_menu_icon[key] = value[1]
			end

			vim_item.kind = (custom_menu_icon[vim_item.kind] or "") .. vim_item.kind
			vim_item.kind = source_icons[entry.source.name] or vim_item.kind

			return vim_item
		end,
	},
	preselect = "item",
	window = {
		completion = { border = "single" },
		documentation = { border = "single" },
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

local bufIsBig = function(bufnr)
	local max_filesize = 100 * 1024 -- 100 KB
	---@diagnostic disable-next-line: undefined-field
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		return true
	else
		return false
	end
end

vim.api.nvim_create_autocmd('BufReadPre', {
	callback = function(t)
		local sources = default_cmp_sources
		if not bufIsBig(t.buf) then
			sources[#sources + 1] = { name = "codeium", keyword_length = 3 }
		end
		cmp.setup.buffer {
			sources = sources
		}
	end
})
