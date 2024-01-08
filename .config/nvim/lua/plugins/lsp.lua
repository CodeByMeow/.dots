return {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- AUTOCOMPLETION
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-calc",
        },
    },
    -- SNIPPETS
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
    },
    { "dcampos/cmp-emmet-vim",     dependencies = { "mattn/emmet-vim" } },
    -- LSP SUPPORT
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x",                     lazy = true, config = false },
    -- LSPSAGA
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            local kind = require("config.icons").kind
            require("lspsaga").setup({
                ui = {
                    kind = kind,
                    border = "rounded",
                    code_action = " ",
                },
            })
        end
    },
    keys = {
        { "gf",         "<cmd>Lspsaga finder<CR>" },
        { "gr",         "<cmd>Lspsaga rename<CR>" },
        { "grp",        "<cmd>Lspsaga rename ++project<CR>" },
        { "gt",         "<cmd>Lspsaga peek_definition<CR>" },
        { "gd",         "<cmd>Lspsaga goto_definition<CR>" },
        { "sd",         "<cmd>Lspsaga show_buf_diagnostics<CR>" },
        { "<leader>n",  "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
        { "<leader>e",  "<cmd>Lspsaga diagnostic_jump_next<CR>" },
        { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
        { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
        { "H",          "<cmd>Lspsaga hover_doc<CR>" },
        { "ga",         "<cmd>Lspsaga code_action<CR>",         mode = { "n", "v" } },
        { "<leader>t",  "<cmd>Lspsaga term_toggle<CR>",         mode = { "n", "t" } }
    }
}
