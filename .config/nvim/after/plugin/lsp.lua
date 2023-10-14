local lsp_zero = require("lsp-zero")
local icons = require("core.kind")
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- LSP MANAGER
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"cssls",
		"html",
		"intelephense",
		"jsonls",
		"eslint",
		"prisma",
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
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- CMP
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
local cmp_kinds = {
	Text = icons.kind["Text"][1],
	Method = icons.kind["Method"][1],
	Function = icons.kind["Function"][1],
	Constructor = icons.kind["Constructor"][1],
	Field = icons.kind["Field"][1],
	Variable = icons.kind["Variable"][1],
	Class = icons.kind["Class"][1],
	Interface = icons.kind["Interface"][1],
	Module = icons.kind["Module"][1],
	Property = icons.kind["Property"][1],
	Unit = icons.kind["Unit"][1],
	Value = icons.kind["Value"][1],
	Enum = icons.kind["Enum"][1],
	Keyword = icons.kind["Key"][1],
	Snippet = icons.kind["Snippet"][1],
	File = icons.kind["File"][1],
	Folder = icons.kind["Folder"][1],
	EnumMember = icons.kind["EnumMember"][1],
	Constant = icons.kind["Constant"][1],
	Struct = icons.kind["Struct"][1],
	Event = icons.kind["Event"][1],
	Operator = icons.kind["Operator"][1],
	TypeParameter = icons.kind["TypeParameter"][1],
	Color = "  ",
}

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
	sources = cmp.config.sources({
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
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "cmp_tabnine" },
		{ name = "path" },
		{ name = "treesitter" },
		{ name = "calc" },
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
			vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
			if entry.source.name == "calc" then
				vim_item.kind = " 󰃬 "
			end

			return vim_item
		end,
	},
	preselect = "item",
	window = {
		completion = {
			border = "rounded",
			scrollbar = "║",
		},
		documentation = {
			border = "rounded",
			scrollbar = "║",
		},
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
