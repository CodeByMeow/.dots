local status, lsp = pcall(require, 'lsp-zero')
if not status then return end

lsp.preset('recommended')

local server_list = {
    "tsserver", "sumneko_lua", "cssls", "html", "emmet_ls", "intelephense", "tailwindcss", "texlab",
    "jsonls"
}

lsp.ensure_installed(server_list)

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = cmp.config.sources({
        { name = 'nvim_lsp', },
        { name = 'buffer' },
        { name = 'path' },
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
    end
})


lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
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

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})