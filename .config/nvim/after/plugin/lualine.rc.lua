local lualine = require('lualine')
local icons = require('7ColorsCat.config').icons

local function getclientnames()
    local bufnr = vim.fn.bufnr('')
    local clients = vim.lsp.buf_get_clients(bufnr)
    local clientnames_tbl = {}

    for _, v in pairs(clients) do
        if v.name then
            table.insert(clientnames_tbl, v.name)
        end
    end
    return table.concat(clientnames_tbl, ',')
end

local lsp_text_provider = function()
    local bufnr = vim.fn.bufnr('')
    local clients = vim.lsp.buf_get_clients(bufnr)
    if vim.tbl_isempty(clients) then return '' end
    local names = getclientnames()
    return string.format('🕹️ [%s]', names)
end

local function fg(name)
    return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
    end
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'rose-pine',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {
                'netrw'
            },
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                "filetype",
                icon_only = true,
                separator = "",
                padding = {
                    left = 1, right = 0
                }
            },
            { "filename", path = 1, symbols = { modified = " ", readonly = " ", unnamed = " " } },
        },
        lualine_x = {
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    hint = icons.diagnostics.Hint,
                    info = icons.diagnostics.Info
                },
                'encoding',
            },
            {
                "diff",
                symbols = {
                    added = icons.git.added,
                    modified = icons.git.modified,
                    removed = icons.git.removed,
                },
            },
            lsp_text_provider,
        },
        lualine_y = { 'filesize',
            {
                "progress",
                separator = " ",
                padding = { left = 1, right = 0 }
            },
            { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
            {
                function()
                    return "🕙 " .. os.date("%R")
                end,
            },
        }
    },
    extensions = { 'fugitive', 'lazy' }
}
