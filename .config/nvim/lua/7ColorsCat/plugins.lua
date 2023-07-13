return {
    "tamton-aquib/staline.nvim",
    "mbbill/undotree",
    "mattn/emmet-vim",
    "jose-elias-alvarez/null-ls.nvim",
    "max397574/better-escape.nvim",
    "akinsho/bufferline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "folke/zen-mode.nvim",
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
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp"
            },
            "rafamadriz/friendly-snippets",
            { "tzachar/cmp-tabnine", build = "./install.sh" },
        }
    },
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'      -- optional
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
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
    { 'NeogitOrg/neogit',            dependencies = 'nvim-lua/plenary.nvim' },
    { 'kevinhwang91/nvim-ufo',       dependencies = 'kevinhwang91/promise-async' },
    { "ziontee113/icon-picker.nvim", dependencies = 'stevearc/dressing.nvim' },
    {
        "themaxmarchuk/tailwindcss-colors.nvim",
        -- load only on require("tailwindcss-colors")
        module = "tailwindcss-colors",
        -- run the setup function after plugin is loaded
    },
    -- DAP
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "nvim-telescope/telescope-dap.nvim"
        },
    },
    "sunjon/shade.nvim",
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    -- default options: exact mode, multi window, all directions, with a backdrop
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
        },
    },
    'lambdalisue/suda.vim',
}
