vim.g.completeopt = "menu,menuone,noselect,noinsert"
local icons = require('nvim-nonicons')
local source_mapping = {
  nvim_lsp = " ",
  nvim_lua = icons.get('lua'),
  path = icons.get('file-directory'),
  rg = icons.get('tag'),
  buffer = icons.get('device-camera'),
  cmp_tabnine = " ",
  treesitter = " 滑",

}
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
local cmp = require 'cmp'
local lspkind = require('lspkind')
lspkind.init({
  preset = 'codicons',
  symbol_map = {
    Text = icons.get('typography'),
    Method = icons.get('package'),
    Function = "",
    Constructor = icons.get('gear'),
    Field = icons.get('field'),
    Variable = icons.get('variable'),
    Class = icons.get('class'),
    Interface = icons.get('interface'),
    Module = icons.get('package'),
    Property = icons.get('tools'),
    Unit = icons.get('nodte'),
    Value = icons.get('number'),
    Enum = "",
    Keyword = icons.get('keyword'),
    Snippet = icons.get('snippet'),
    Color = icons.get('heart'),
    File = icons.get('file'),
    Reference = icons.get('cross-reference'),
    Folder = icons.get('file-directory'),
    EnumMember = "",
    Constant = icons.get('constant'),
    Struct = icons.get('struct'),
    Event = "ﯓ",
    Operator = "",
    TypeParameter = icons.get('type')
  },
})

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
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
    format = lspkind.cmp_format({
      mode = "text",
      before = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", lspkind.symbol_map[vim_item.kind], vim_item.kind);
        vim_item.menu = source_mapping[entry.source.name]
        return vim_item
      end
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})
