return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"dcampos/cmp-emmet-vim",
			dependencies = { "mattn/emmet-vim" },
		},
		{
			"L3MON4D3/LuaSnip",
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
	config = function()
		local cmp = require("cmp")
		local icons = require("config.icons")
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
			{ name = "codeium" },
			{ name = "nvim_lua" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "path" },
			{ name = "cmp_tabnine", keyword_length = 2 },
			{ name = "luasnip", keyword_length = 2 },
			{ name = "treesitter" },
			{ name = "emmet_vim" },
		})

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-e>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
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
				completion = { border = "rounded", scrollbar = false },
				documentation = { border = "rounded", scrollbar = false },
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
					local color_item = require("nvim-highlight-colors").format(entry, { kind = vim_item.kind })
					local color = require("nvim-highlight-colors.color.utils")
					local entryItem = entry:get_completion_item()
					local entryDocs = entryItem.documentation
					local color_hex = ""
					if entryDocs ~= nil and type(entryDocs) == "string" then
						color_hex = color.get_color_value(entryDocs)
					end

					if color_item.abbr_hl_group then
						vim_item.kind_hl_group = color_item.abbr_hl_group
						vim_item.kind = color_item.abbr .. " " .. color_hex
					end

					local custom_menu_icon = {}
					local source_icons = { calc = " 󰃬 ", cmp_tabnine = "󰫈  Tabnine", codeium = "󰁨  Codeium" }

					for key, value in pairs(icons.kinds) do
						custom_menu_icon[key] = value[1]
					end

					vim_item.kind = (custom_menu_icon[vim_item.kind] or "  ") .. " " .. vim_item.kind
					vim_item.kind = source_icons[entry.source.name] or vim_item.kind
					return vim_item
				end,
			},
			enabled = function()
				local filetype = vim.bo.filetype
				if filetype == "scss" then
					return vim.fn.getline("."):match("%$") == nil
				end
				return true
			end,
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

		vim.api.nvim_create_autocmd("BufReadPre", {
			callback = function()
				cmp.setup.buffer({
					sources = default_cmp_sources,
				})
			end,
		})
	end,
}
