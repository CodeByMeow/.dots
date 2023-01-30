local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    ensure_installed = { "help", "html", "javascript", "typescript", "lua", "css", "php", "jsdoc", "json", "tsx",
        "markdown" },
    sync_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
    },
    matchup = {
        enable = true,
    },
    autopairs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true, disable = { "yaml" } },
    markid = { enable = true },
}

vim.keymap.set('n', ';p', '<cmd>:TSPlaygroundToggle<cr>', { noremap = true, silent = true })
