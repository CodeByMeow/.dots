local icons = require("7ColorsCat.config").icons.diagnostics
require "staline".setup {
    sections = {
        left = { 'mode', ' ', 'branch', ' ', 'lsp' },
        mid = { 'lsp_name' },
        right = { 'file_name', 'file_size', 'line_column' }
    },
    mode_colors = {
        n = "#689D6A",
        i = "#3e8fb0",
        c = "#f6c177",
        v = "#CE6CA0",
        s = "#C74E01"
    },
    mode_icons = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        v = "VISUAL",
        s = "SELECT"
    },
    lsp_symbols = {
        Error = icons.Error,
        Info = icons.Info,
        Warn = icons.Warn,
        Hint = icons.Hint,
    },
    defaults = {
        true_colors       = true,
        line_column       = "[%l/%L] :%c 並%p%% ",
        branch_symbol     = " ",
        lsp_client_symbol = "📡 ",
        mod_symbol        = "  ",
    }
}
