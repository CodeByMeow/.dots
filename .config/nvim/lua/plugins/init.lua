vim.cmd "packadd packer.nvim"

local plugins = {
  {
    "nvim-lua/plenary.nvim",
    module = "plenary"
  },

  { "wbthomason/packer.nvim" },

  {
    "catppuccin/nvim", as = "catppuccin",
    config = function()
      require "plugins.configs.themes"
    end
  },

  { "dstein64/vim-startuptime" },
  { "nathom/filetype.nvim" },

  -- Optimiser
  { "lewis6991/impatient.nvim" },

  -- Popup API
  { "nvim-lua/popup.nvim" },

  -- Indent detection
  {
    "Darazaki/indent-o-matic",
    event = "BufReadPost",
    config = function()
      require "plugins.configs.indent-o-matic"
    end
  },

  -- Tmux
  {
    "aserowy/tmux.nvim",
    config = function()
      require "plugins.configs.tmux"
    end
  },

  -- Notification Enhancer
  {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      require "plugins.configs.notify"
    end,
  },

  -- Neovim UI Enhancer
  { "MunifTanjim/nui.nvim" },

  -- Cursorhold fix
  {
    "antoinemadec/FixCursorHold.nvim",
    event = { "BufRead", "BufNewFile" },
  },

  -- Icon
  {
    "yamatsum/nvim-nonicons",
    requires = { "kyazdani42/nvim-web-devicons" }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    config = function()
      require "plugins.configs.blankline"
    end,
  },

  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end,
  },

  -- Tabline
  {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require "plugins.configs.bufferline"
    end
  },

  -- Better buffer closing
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    setup = function()
      require("core.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = require("core.lazy_load").treesitter_cmds,
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    ft = "gitcommit",
    setup = function()
      require("core.lazy_load").gitsigns()
    end,
    config = function()
      require("plugins.configs.others").gitsigns()
    end,
  },

  {
    "williamboman/mason.nvim",
  },

  {
    "williamboman/mason-lspconfig.nvim", after = "mason.nvim",
    config = function()
      require "plugins.configs.mason"
    end
  },

  {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    module = "lspconfig",
    event = "VimEnter",
    config = function()
      require "plugins.configs.mason-lspconfig"
      require "plugins.configs.diagnostic_signs"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  },

  {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  { "onsails/lspkind-nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-path", after = "cmp-buffer" },
  {
    "hrsh7th/cmp-vsnip",
    wants = "friendly-snippets",
    after = "nvim-cmp"
  },
  { "hrsh7th/vim-vsnip" },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh"
  },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },

  -- Key menu
  {
    "linty-org/key-menu.nvim",
    config = function()
      require "plugins.configs.keymenu"
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    -- cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require "plugins.configs.lspsaga"
    end
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins.configs.toggleterm"
    end
  },

  -- Smooth escaping
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require "plugins.configs.better_escape"
    end,
  },

  -- Hightlight cursor line
  {
    "yamatsum/nvim-cursorline",
    config = function()
      require "plugins.configs.cursorline"
    end
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require "plugins.configs.neoscroll"
    end
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "plugins.configs.autopairs"
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require("plugins.configs.others").comment()
    end,
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = function()
      require "plugins.configs.neotree"
    end
  },

  -- Parenthesis highlighting
  {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter"
  },

  -- Autoclose tags
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter"
  },

  { 'max-0406/autoclose.nvim' },

  -- Context based commenting
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  },

  {
    'andymass/vim-matchup',
    after = 'nvim-treesitter'
  },

  -- Get extra JSON schemas
  {
    "b0o/SchemaStore.nvim",
  },

  -- Light speed
  { 'ggandor/lightspeed.nvim' },

  -- Auto rename tag html
  { 'AndrewRadev/tagalong.vim' },

  -- Context blame
  { 'haringsrob/nvim_context_vt',
    after = "nvim-treesitter"
  },

  -- Number of result search
  {
    "kevinhwang91/nvim-hlslens",
    keys = { "/" },
    config = function()
      require("hlslens").setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "auto",
      })
    end,
  },

  -- Format
  {
    'jose-elias-alvarez/null-ls.nvim',
    module = 'lspconfig',
    config = function()
      require "plugins.configs.null-ls"
    end
  },

  -- Surround
  {
    'kylechui/nvim-surround',
    config = function()
      require "plugins.configs.surround"
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Statusline
  {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function()
      require "plugins.configs.galaxyline"
    end
  },

  {
    'j-hui/fidget.nvim',
    config = function()
      require "plugins.configs.others".fidget()
    end
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }

}

require("core.packer").run(plugins)
