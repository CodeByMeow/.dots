local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup({ function(use)
  -- Plugin manager
  use { 'wbthomason/packer.nvim' }

  -- Theme
  use {
    "sainnhe/gruvbox-material",
    config = function()
      require "themes"
    end
  }

  -- Optimiser
  use { 'lewis6991/impatient.nvim' }

  -- Lua functions
  use { 'nvim-lua/plenary.nvim' }

  -- Popup API
  use { 'nvim-lua/popup.nvim' }

  -- Indent detection
  use {
    "Darazaki/indent-o-matic",
    event = "BufReadPost",
    config = function()
      require "configs.indent-o-matic"
    end,
  }

  -- Tmux
  use {
    'aserowy/tmux.nvim',
    config = function()
      require "configs.tmux"
    end
  }

  -- Notification Enhancer
  use {
    'rcarriga/nvim-notify',
    event = "VimEnter",
    config = function()
      require "configs.notify"
    end,
  }

  -- Neovim UI Enhancer
  use { "MunifTanjim/nui.nvim" }

  -- Cursorhold fix
  use {
    "antoinemadec/FixCursorHold.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  }

  -- Panel focus
  use {
    "beauwilliams/focus.nvim",
    event = "BufRead",
    config = function()
      require("focus").setup()
    end,
  }

  -- Icon
  use {
    'yamatsum/nvim-nonicons',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Statusline
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function()
      require "configs.galaxyline"
    end
  }

  -- Tabline
  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require "configs.bufferline"
    end,
  }

  -- Better buffer closing
  use {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" }
  }

  -- File explorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = function()
      require "configs.neo-tree"
    end
  }

  -- Parenthesis highlighting
  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter"
  }

  -- Autoclose tags
  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter"
  }

  use { 'max-0406/autoclose.nvim' }

  -- Context based commenting
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  }

  use {
    'andymass/vim-matchup',
    after = 'nvim-treesitter'
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require "configs.treesitter"
    end
  }

  -- Snippet collection
  use {
    "rafamadriz/friendly-snippets",
    opt = true
  }

  -- Completion engine
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'onsails/lspkind-nvim' }
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh'
  }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }

  -- Built-in LSP
  use {
    "neovim/nvim-lspconfig",
    event = "VimEnter"
  }

  -- LSP manager
  use {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
      require "configs.nvim-lsp-installer"
      require "configs.lsp"
    end,
  }

  -- Key menu
  use {
    'linty-org/key-menu.nvim',
    config = function()
      require "configs.key-menu"
    end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function()
      require "configs.telescope"
    end
  }

  -- LSP symbols
  use {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = function()
      require "configs.aerial"
    end,
  }

  use {
    'tami5/lspsaga.nvim',
    config = function()
      require "configs.lspsaga"
    end
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require "configs.toggleterm"
    end
  }

  -- Git integration
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require "configs.gitsigns"
    end,
  }

  -- Color highlighting
  use {
    "norcalli/nvim-colorizer.lua",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.colorizer"
    end,
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "configs.autopairs"
    end,
  }

  -- Commenting
  use {
    "numToStr/Comment.nvim",
    config = function()
      require "configs.Comment"
    end,
  }

  -- Indentation
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require "configs.indent-line"
    end,
  }

  -- Smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require "configs.neoscroll"
    end
  }

  -- Smooth escaping
  use { "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require "configs.better_escape"
    end,
  }

  -- Get extra JSON schemas
  use {
    "b0o/SchemaStore.nvim",
  }

  -- Hightlight cursor line
  use {
    'yamatsum/nvim-cursorline',
    config = function()
      require "configs.cursorline"
    end
  }

  -- Light speed
  use { 'ggandor/lightspeed.nvim' }

  -- Auto rename tag html
  use { 'AndrewRadev/tagalong.vim' }

  -- Auto mkdir parent path
  use { 'jghauser/mkdir.nvim' }

  -- Context blame
  use { 'haringsrob/nvim_context_vt' }

  -- Scrollbar
  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
    end
  }

  -- TODO comment
  use {
    "folke/todo-comments.nvim",
    config = function()
      require "todo-comments".setup()
    end
  }

  -- Number of result search
  use {
    "kevinhwang91/nvim-hlslens",
    keys = { "/" },
    config = function()
      require("hlslens").setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "auto",
      })
    end,
  }


end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
})
