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
  return string.format('󰒔  LSP [%s]', names)
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function getLines()
  return tostring(vim.api.nvim_win_get_cursor(0)[1]) .. "/" .. tostring(vim.api.nvim_buf_line_count(0))
end

local function getColumn()
  local val = vim.api.nvim_win_get_cursor(0)[2]
  -- pad value to 3 units to stop geometry shift
  return string.format("%03d", val)
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
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
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        source = diff_source,
        color_added = "#a7c080",
        color_modified = "#ffdf1b",
        color_removed = "#ff6666",
      },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = "󰅚 ", warn = "󰻍 ", hint = "󰌶 ", info = "󰋽 " },
      },
      {
        'filename',
        file_status = true, -- display file status
        path = 1, -- 0 - just filename
      },
    },
    lualine_x = {
      lsp_text_provider, { "filetype", icon_only = true }
    },
    lualine_y = { 'progress' },
    lualine_z = {
      { getColumn, padding = { left = 1, right = 0 } },
      { getLines, icon = "", padding = 1 }
    }
  },
  tabline = {},
  extensions = { 'fugitive' }
}
