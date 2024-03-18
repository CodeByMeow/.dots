local M = {
	"hrsh7th/nvim-cmp",
	envent = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/cmp-buffer",
			envent = "InsertEnter",
		},
		{
			"hrsh7th/cmp-path",
			envent = "InsertEnter",
		},
		{
			"hrsh7th/cmp-nvim-lsp",
			envent = "InsertEnter",
		},
		{
			"hrsh7th/cmp-nvim-lua",
			envent = "InsertEnter",
		},
		{
			"hrsh7th/cmp-cmdline",
			envent = "InsertEnter",
		},
		{
			"hrsh7th/cmp-calc",
			envent = "InsertEnter",
		},
		{
			"saadparwaiz1/cmp_luasnip",
			envent = "InsertEnter",
		},
		{
			"dcampos/cmp-emmet-vim",
			dependencies = { "mattn/emmet-vim" },
			envent = "InsertEnter",
		},
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			opts = {
				history = true,
				delete_check_events = "TextChanged",
			},
		},
	},
}

function M.config()
	local cmp = require("cmp")
	local icons = require("user.icons")
	local luasnip = require("luasnip")

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

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
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "path" },
		{ name = "treesitter" },
		{ name = "calc" },
		{ name = "emmet_vim" },
	})

	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
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
		preselect = "item",
		window = {
			completion = { border = "single", scrollbar = false },
			documentation = { border = "single", scrollbar = false },
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		formatting = {
			fields = { "abbr", "menu", "kind" },
			expandable_indicator = true,
			format = function(entry, vim_item)
				local custom_menu_icon = {}
				local source_icons = { calc = " 󰃬 ", codeium = " " }
				for key, value in pairs(icons.kind) do
					custom_menu_icon[key] = value[1]
				end

				vim_item.kind = (custom_menu_icon[vim_item.kind] or "  ") .. " " .. vim_item.kind
				vim_item.kind = source_icons[entry.source.name] or vim_item.kind

				return vim_item
			end,
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

	vim.api.nvim_create_autocmd("BufReadPre", {
		callback = function(t)
			local sources = default_cmp_sources
			if not bufIsBig(t.buf) then
				sources[#sources + 1] = { name = "codeium", keyword_length = 3 }
			end
			cmp.setup.buffer({
				sources = sources,
			})
		end,
	})
end

return M
