return {
    { 'rose-pine/neovim', as = 'rose-pine' },
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        dependencies = {
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/playground",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "andymass/vim-matchup",
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-telescope/telescope-file-browser.nvim' }
    },
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

    "mbbill/undotree",
    "kyazdani42/nvim-web-devicons",

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    { "tzachar/cmp-tabnine", build = "./install.sh" },

    "lewis6991/impatient.nvim", -- Optimize
    "max397574/better-escape.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "akinsho/bufferline.nvim",
    'David-Kunz/markid',
    "lukas-reineke/indent-blankline.nvim",
    "glepnir/lspsaga.nvim",
    "karb94/neoscroll.nvim", -- Smooth scrolling
    "lewis6991/gitsigns.nvim",
    'dinhhuy258/git.nvim',
    "rcarriga/nvim-notify",
    -- Better buffer closing
    "famiu/bufdelete.nvim",
    "akinsho/toggleterm.nvim",
    "yamatsum/nvim-cursorline",
    "numToStr/Comment.nvim",
    -- Auto rename tag html
    "AndrewRadev/tagalong.vim",
    -- Standalone UI for nvim-lsp progress
    "j-hui/fidget.nvim",
    -- Convert template string
    "axelvc/template-string.nvim",
    -- Surround
    "kylechui/nvim-surround",
    --Tmux
    "aserowy/tmux.nvim",
    -- Number toggle
    "sitiom/nvim-numbertoggle",
    --highlight color
    'brenoprata10/nvim-highlight-colors',
    --vim diff
    {
        'sindrets/diffview.nvim',
        build = 'nvim-lua/plenary.nvim'
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    'vimwiki/vimwiki' -- VimWiki

}
