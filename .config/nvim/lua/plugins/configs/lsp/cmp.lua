vim.g.completeopt = "menu,menuone,noselect,noinsert"
local ok, cmp = pcall(require, "cmp")

if not ok then
  return
end
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
      == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Setup nvim-cmp.
local cmp = require("cmp")
local types = require("cmp.types")
local kind = require("plugins.configs.lsp.kind")
local str = require("cmp.utils.str")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end
  },

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"]() == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    -- { name = 'luasnip' },
    -- For ultisnips user.
    -- { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'cmp_tabnine' },
    { name = 'path' },
    { name = 'treesitter' },
    { name = 'rg' },
  },
  formatting = {
    format = kind.cmp_format({
      with_text = true,
      before = function(entry, vim_item)
        -- Get the full snippet (and only keep first line)
        local word = entry:get_insert_text()
        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
          word = vim.lsp.util.parse_snippet(word)
        end
        word = str.oneline(word)

        -- concatenates the string
        local max = 50
        if string.len(word) >= max then
          local before = string.sub(word, 1, math.floor((max - 3) / 2))
          word = before .. "..."
        end

        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
            and string.sub(vim_item.abbr, -1, -1) == "~"
        then
          word = word .. "~"
        end
        vim_item.abbr = word

        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0

        return vim_item
      end,
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }

})
