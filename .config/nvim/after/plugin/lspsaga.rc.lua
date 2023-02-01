local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

local colors = {
    red = '#e95678',
    magenta = '#b33076',
    orange = '#FF8700',
    yellow = '#f7bb3b',
    green = '#afd700',
    cyan = '#36d0e0',
    blue = '#61afef',
    purple = '#CBA6F7',
    white = '#d1d4cf',
    black = '#1c1c19',
    gray = '#6e6b6b',
    fg = '#f2f2bf',
}

saga.setup {
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    request_timeout = 2000,
    ui = {
        -- currently only round theme
        theme = 'round',
        -- border type can be single,double,rounded,solid,shadow.
        border = 'single',
        winblend = 0,
        expand = '',
        collapse = '',
        preview = ' ',
        code_action = '💡',
        diagnostic = ' ',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal bakcground color
            normal_bg = '#1d1536',
            --title background color
            title_bg = colors.red,
            red = colors.red,
            magenta = colors.magenta,
            orange = colors.orange,
            yellow = colors.yellow,
            green = colors.green,
            cyan = colors.cyan,
            blue = colors.blue,
            purple = colors.purple,
            white = colors.white,
            black = colors.black,
        },
        kind = {
            File = ' ',
            Module = ' ',
            Namespace = ' ',
            Package = ' ',
            Class = '  ',
            Method = ' ',
            Property = ' ',
            Field = ' ',
            Constructor = ' ',
            Enum = ' ',
            Interface = ' ',
            Function = '  ',
            Variable = ' ',
            Constant = ' ',
            String = '  ',
            Number = '  ',
            Boolean = ' ',
            Array = ' ',
            Object = '  ',
            Key = ' ',
            Null = ' ',
            EnumMember = ' ',
            Struct = ' ',
            Event = '',
            Operator = ' ',
            TypeParameter = 'T ',
            TypeAlias = 'T ',
            Parameter = ' ',
            StaticMethod = ' ',
            Macro = ' ',
            Text = ' ',
            Snippet = ' ',
            Folder = ' ',
            Unit = ' ',
            Value = ' ',
        },
    },
    symbol_in_winbar = {
        enable = true,
        separator = '  ',
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
    },
}

local keymap = vim.keymap.set

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to Definition
-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show buffer diagnostic
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "<C-N>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toglle Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
--
-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<C-\\>", "<cmd>Lspsaga term_toggle<CR>")
