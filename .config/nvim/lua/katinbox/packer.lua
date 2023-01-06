local status, packer = pcall(require, 'packer')
if (not status) then
    print('Packer is not installed')
    return
end

vim.cmd [[packadd packer.nvim]]

return packer.startup({ function(use)
    use 'wbthomason/packer.nvim'
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use "nvim-lua/plenary.nvim"
    use "nvim-lualine/lualine.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }
    use { "nvim-telescope/telescope.nvim", requires = 'nvim-telescope/telescope-file-browser.nvim' }
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "nvim-treesitter/playground"
    use "mbbill/undotree"
    use "kyazdani42/nvim-web-devicons"
    use "dstein64/vim-startuptime"

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }
    use { "tzachar/cmp-tabnine", run = "./install.sh" }

    use "lewis6991/impatient.nvim" -- Optimize
    use "nathom/filetype.nvim"
    use "max397574/better-escape.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "akinsho/bufferline.nvim"
    use "norcalli/nvim-colorizer.lua"
    use {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter"
    }
    use 'David-Kunz/markid'
    use "lukas-reineke/indent-blankline.nvim"
    use "glepnir/lspsaga.nvim" -- LSP UIs
    use "karb94/neoscroll.nvim" -- Smooth scrolling
    use "lewis6991/gitsigns.nvim"
    use 'dinhhuy258/git.nvim'
    use "rcarriga/nvim-notify"
    -- Better buffer closing
    use {
        "famiu/bufdelete.nvim",
        cmd = { "Bdelete", "Bwipeout" }
    }
    use "akinsho/toggleterm.nvim"
    use "yamatsum/nvim-cursorline"
    use "numToStr/Comment.nvim"
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter"
    }
    use {
        "andymass/vim-matchup",
        after = "nvim-treesitter"
    }
    -- Auto rename tag html
    use "AndrewRadev/tagalong.vim"
    -- Standalone UI for nvim-lsp progress
    use "j-hui/fidget.nvim"
    -- Convert template string
    use "axelvc/template-string.nvim"
    -- Surround
    use {
        "kylechui/nvim-surround",
    }
    --Tmux
    use "aserowy/tmux.nvim"
    -- Number toggle
    use {
        "sitiom/nvim-numbertoggle",
    }
    --vim diff
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    --highlight color
    use {
        'brenoprata10/nvim-highlight-colors',
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    use 'lervag/vimtex' -- Latex

end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    } })
