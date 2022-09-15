local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {},
  -- Options with default value
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "rounded",
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.
  saga_winblend = 0,
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>', next = '<C-n>' },
  diagnostic_header = { " ", " ", " ", "" },
  -- use emoji lightbulb in default
  code_action_icon = "",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  definition_action_keys = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },
  rename_in_select = true,
  -- show symbols in winbar must nightly
  --[[ symbol_in_winbar = {
    in_custom = true,
    enable = false,
    separator = ' >',
    show_file = true,
    click_support = false,
  }, ]]
}
--[[ local function get_file_name(include_path)
  local file_name = require('lspsaga.symbolwinbar').get_file_name({})
  if vim.fn.bufname '%' == '' then return '' end
  if include_path == false then return file_name end
  -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
  local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
  local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
  local file_path = ''
  for _, cur in ipairs(path_list) do
    file_path = (cur == '.' or cur == '~') and '' or
        file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
  end
  return file_path .. file_name
end

local function config_winbar()
  local exclude = {
    ['teminal'] = true,
    ['toggleterm'] = true,
    ['prompt'] = true,
    ['neotree'] = true,
    ['help'] = true,
  } -- Ignore float windows and exclude filetype
  if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
    vim.wo.winbar = ''
  else
    local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
    local sym
    if ok then sym = lspsaga.get_symbol_node() end
    local win_val = ''
    win_val = get_file_name(true) -- set to true to include path
    if sym ~= nil then win_val = win_val .. sym end
    vim.wo.winbar = win_val
  end
end ]]

local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }

--[[ vim.api.nvim_create_autocmd(events, {
  pattern = '*',
  callback = function() config_winbar() end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspsagaUpdateSymbol',
  callback = function() config_winbar() end,
}) ]]

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<Cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<Cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<Cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<Cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<Cr>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<Cr>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<Cr>', opts)
