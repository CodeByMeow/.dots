local status, lualine = pcall(require, 'lualine')
if (not status) then return end

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
    return string.format('LSP [%s]', names)
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
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
        lualine_c = { {
            'filename',
            file_status = true, -- display file status
            path = 0, -- 0 - just filename
        } },
        lualine_x = { {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = "E ", warn = "W ", hint = "H ", info = "I " },
            'encoding',
            'filetye'
        },
            lsp_text_provider },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
            'filename',
            file_status = true,
            path = 1 -- 1 =  relative path
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
}
