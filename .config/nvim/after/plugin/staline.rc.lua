local icons = require("7ColorsCat.config").icons.diagnostics
require "staline".setup {
    sections = {
        left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
        mid = { 'lsp_name' },
        right = { 'file_name', 'file_size', 'line_column' }
    },
    mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
    },
    mode_icons = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        v = "VISUAL", -- etc..
    },
    lsp_symbols = {
        Error = icons.Error,
        Info = icons.Info,
        Warn = icons.Warn,
        Hint = icons.Hint,
    },
    defaults = {
        true_colors = true,
        line_column = "[%l/%L] :%c 並%p%% ",
        branch_symbol = " ",
        lsp_client_symbol = "  ",
    }
}
