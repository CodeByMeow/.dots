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
  diagnostic_header = { "󰅚 ", "󰻍 ", "󰋽 ", "󰌶 " },
  -- use emoji lightbulb in default
  code_action_icon = "󰌶 ",
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
    def = '󰟙 ',
    ref = '󰘬 ',
    link = '󰌹 ',
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
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<Cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<Cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<Cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<Cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<Cr>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<Cr>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<Cr>', opts)
