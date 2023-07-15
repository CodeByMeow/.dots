local lsp = require('lsp-zero')
local icons = require('7ColorsCat.config').icons

lsp.preset('recommended')
local server_list = {
    "tsserver", "lua_ls", "cssls", "html", "intelephense",
    "jsonls", "eslint", "tailwindcss"
}

lsp.ensure_installed(server_list)

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('tailwindcss', {
    on_attach = function(_, bufnr)
        require('tailwindcss-colors').buf_attach(bufnr)
    end
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

require('luasnip.loaders.from_vscode').lazy_load()

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
    -- Reference = icons.kind["Reference"][1],
    Folder = icons.kind["Folder"][1],
    EnumMember = icons.kind["EnumMember"][1],
    Constant = icons.kind["Constant"][1],
    Struct = icons.kind["Struct"][1],
    Event = icons.kind["Event"][1],
    Operator = icons.kind["Operator"][1],
    TypeParameter = icons.kind["TypeParameter"][1],
    Color = '  ',
}

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = cmp.config.sources({
        {
            name = 'nvim_lsp',
            entry_filter = function(entry)
                if entry:get_kind() == 15 then
                    return false
                end

                return true
            end
        },
        { name = 'nvim_lua' },
        { name = 'buffer',     keyword_length = 3 },
        { name = 'luasnip',    keyword_length = 2 },
        { name = 'cmp_tabnine' },
        { name = 'path' },
        { name = 'treesitter' },
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
        format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            return vim_item
        end,
    },

})


lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info
    },
    setup_servers_on_start = true,
    set_lsp_keymaps = false,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
})

lsp.nvim_workspace()

lsp.setup()

vim.keymap.set("i", "<leader><Tab>", function()
    require('luasnip').jump(1)
end)

vim.keymap.set("i", "<leader><S-Tab>", function()
    require('luasnip').jump(-1)
end)
