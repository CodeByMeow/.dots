local git = require("core.kind").git
local icons = require("core.kind").diagnostics

local nicon = "NORMAL"
local iicon = "INSERT"
local vicon = "VISUAL"
local cicon = "COMMAND"
local ricon = "REPLACE"
local ticon = "TERMINAL"

local mode_icons = {
    ["n"] = nicon,
    ["no"] = nicon,
    ["niI"] = nicon,
    ["niR"] = nicon,
    ["no"] = nicon,
    ["niV"] = nicon,
    ["nov"] = nicon,
    ["noV"] = nicon,
    ["i"] = iicon,
    ["ic"] = iicon,
    ["ix"] = iicon,
    ["s"] = iicon,
    ["S"] = iicon,
    ["v"] = vicon,
    ["V"] = vicon,
    [""] = vicon,
    ["r"] = ricon,
    ["r?"] = ricon,
    ["c"] = cicon,
    ["t"] = ticon,
    ["!"] = ticon,
    ["R"] = ricon,
}

require("staline").setup({
    sections = {
        left = { "-mode", "file_name", "branch", " ", "lsp" },
        mid = { "lsp_name" },
        right = { "file_size", vim.bo.fileencoding:upper(), "line_column" },
    },
    mode_icons = mode_icons,
    mode_colors = {
        i = "#83A598",
        n = "#928374",
        c = "#D65D0E",
        v = "#458588"
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
        lsp_client_symbol = "  ",
        mod_symbol = " " .. git.modified,
        cool_symbol = " " .. " ",
        full_path = false,
    },
})
