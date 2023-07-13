local ts = require("nvim-treesitter.configs")

ts.setup {
    ensure_installed = { "help", "html", "javascript", "typescript", "lua", "css", "php", "jsdoc", "json", "tsx",
        "markdown", "markdown_inline", "vim", "bash" },
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
    autopairs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true, disable = { "yaml" } },
    markid = { enable = true },
    textobjects = {
        select = {
            enable = true
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        }
    },
    ignore_install = { 'help' }
}

vim.keymap.set('n', '<leader>p', '<cmd>:TSPlaygroundToggle<cr>', { noremap = true, silent = true })
