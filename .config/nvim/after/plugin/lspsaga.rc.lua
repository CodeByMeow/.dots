local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
    server_filetype_map = {},
    border_style = "single",
    saga_winblend = 0,
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    diagnostic_header = { "", "", "", "" },
    code_action_icon = "",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_icons = {
        def = 'DEF ',
        ref = 'REF ',
        imp = 'IMP ',
        link = 'LINK ',
    },
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
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<Cr>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<Cr>', opts)
