local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup({ function(use)
  use "wbthomason/packer.nvim"
  use "dstein64/vim-startuptime"
  use "lewis6991/impatient.nvim" -- Optimize
  use "nathom/filetype.nvim"
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "MunifTanjim/nui.nvim" -- Neovim UI Enhancer
  use "max397574/better-escape.nvim"
  use "sitiom/nvim-numbertoggle" -- Number toggle
  use "nvim-lua/popup.nvim" -- Popup API

  use "sainnhe/gruvbox-material"
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "j-hui/fidget.nvim" -- Standalone UI for nvim-lsp progress
  use "akinsho/bufferline.nvim"

  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use "David-Kunz/markid" -- Highlight same variable params
  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter"
  } -- Parenthesis highlighting
  use {
    "andymass/vim-matchup",
    after = "nvim-treesitter"
  }
  -- Auto rename tag html
  use "AndrewRadev/tagalong.vim"
  -- Number of result search
  use {
    "kevinhwang91/nvim-hlslens",
    keys = { "/" },
  }

  use "kyazdani42/nvim-web-devicons"
  use "yamatsum/nvim-nonicons"

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  use "norcalli/nvim-colorizer.lua"
  use {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" }
  } -- Better buffer closing
  use "lukas-reineke/indent-blankline.nvim"
  use "rcarriga/nvim-notify"

  use "brenoprata10/nvim-highlight-colors" -- Highlight color
  use "karb94/neoscroll.nvim" -- Smooth scrolling

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "glepnir/lspsaga.nvim"
  use "L3MON4D3/LuaSnip" -- Snippet
  use "hrsh7th/cmp-buffer" -- nvim-buffer  source for neovim's words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's build-in LSP
  use "hrsh7th/cmp-path" -- nvim-cmp source for neovim's build-in LSP
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/nvim-cmp" -- Completion
  use { "tzachar/cmp-tabnine", run = "./install.sh" }
  use "neovim/nvim-lspconfig" -- LSP
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostic, code actin and more via Lua
  use "MunifTanjim/prettier.nvim"

  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim"

  use "yamatsum/nvim-cursorline"
  use "akinsho/toggleterm.nvim"
  use {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gc", "gb" },
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  } -- Context based commenting
  use "axelvc/template-string.nvim" -- Convert template string
  use "tpope/vim-surround" -- Surround
  use "aserowy/tmux.nvim" --Tmux
  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim"
  } -- Vim diff
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- Delay repeat execution of certain keys
  use "ja-ford/delaytrain.nvim"
  use "folke/zen-mode.nvim"


end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end
    }
  }
})
