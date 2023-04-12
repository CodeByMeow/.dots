require("lspsaga").setup {
    request_timeout = 2000,
    ui = {
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'single',
        winblend = 0,
        expand = '',
        collapse = '',
        code_action = '💡',
        diagnostic = ' ',
        incoming = ' ',
        outgoing = ' ',
        kind = {
            ["File"] = { ' ', 'Tag' },
            ["Module"] = { ' ', 'Exception' },
            ["Namespace"] = { ' ', 'Include' },
            ["Package"] = { ' ', 'Label' },
            ["Class"] = { '  ', 'Include' },
            ["Method"] = { ' ', 'Function' },
            ["Property"] = { ' ', '@property' },
            ["Field"] = { ' ', '@field' },
            ["Constructor"] = { ' ', '@constructor' },
            ["Enum"] = { ' ', '@number' },
            ["Interface"] = { ' ', 'Type' },
            ["Function"] = { '  ', 'Function' },
            ["Variable"] = { ' ', '@variable' },
            ["Constant"] = { ' ', 'Constant' },
            ["String"] = { '  ', 'String' },
            ["Number"] = { '  ', 'Number' },
            ["Boolean"] = { ' ', 'Boolean' },
            ["Array"] = { ' ', 'Type' },
            ["Object"] = { '  ', 'Type' },
            ["Key"] = { ' ', '' },
            ["Null"] = { ' ' },
            ["EnumMember"] = { ' ', 'Number' },
            ["Struct"] = { ' ', 'Number' },
            ["Event"] = { '', 'Constant' },
            ["Operator"] = { ' ', 'Operator' },
            ["TypeParameter"] = { 'T ', 'Type' },
            ["TypeAlias"] = { 'T ', 'Type' },
            ["Parameter"] = { ' ', '@parameter' },
            ["StaticMethod"] = { ' ', 'Function' },
            ["Macro"] = { ' ', 'Macro' },
            ["Text"] = { ' ', 'String' },
            ["Snippet"] = { ' ', '@variable' },
            ["Folder"] = { ' ', '@parameter' },
            ["Unit"] = { ' ', 'Number' },
            ["Value"] = { ' ', '@variable' },
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

keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gR", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_definition<CR>")

-- Go to Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show buffer diagnostic
keymap("n", "sd", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "<leader>j", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<leader>k", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toglle Outline
keymap("n", "<Leader>o", "<cmd>Lspsaga outline<CR>")
-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
-- Hover Doc
keymap("n", "<S-h>", "<cmd>Lspsaga hover_doc<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<CR>")
