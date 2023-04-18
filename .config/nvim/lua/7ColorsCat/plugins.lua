return {
    "nvim-lualine/lualine.nvim",
    "mbbill/undotree",
    "mattn/emmet-vim",
    "jose-elias-alvarez/null-ls.nvim",
    "max397574/better-escape.nvim",
    "akinsho/bufferline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "folke/zen-mode.nvim",
    -- Better buffer closing
    "famiu/bufdelete.nvim",
    "lewis6991/gitsigns.nvim",
    "dinhhuy258/git.nvim",
    "numToStr/Comment.nvim",
    -- Surround
    "kylechui/nvim-surround",
    -- Tmux
    "aserowy/tmux.nvim",
    -- Highlight color
    "brenoprata10/nvim-highlight-colors",
    "kevinhwang91/rnvimr",
    "ThePrimeagen/harpoon",
    "karb94/neoscroll.nvim",
    "RRethy/vim-illuminate",
    "b0o/incline.nvim",
    { "rose-pine/neovim",            name = "rose-pine" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/playground",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "andymass/vim-matchup",
            "windwp/nvim-ts-autotag",
            "David-Kunz/markid",
            "nvim-treesitter/nvim-treesitter-textobjects",
            { "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            { "tzachar/cmp-tabnine", build = "./install.sh" },
        }
    },
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        dependencies = { { "nvim-tree/nvim-web-devicons" }, { "nvim-treesitter/nvim-treesitter" } }
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    {
        "jghauser/mkdir.nvim",
        build = function()
            require('mkdir')
        end,
        event = "BufWritePre"
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    -- icons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- ui components
    { "MunifTanjim/nui.nvim",        lazy = true },
    { 'TimUntersberger/neogit',      dependencies = 'nvim-lua/plenary.nvim' },
    { 'kevinhwang91/nvim-ufo',       dependencies = 'kevinhwang91/promise-async' },
    { "ziontee113/icon-picker.nvim", dependencies = 'stevearc/dressing.nvim' }
}
