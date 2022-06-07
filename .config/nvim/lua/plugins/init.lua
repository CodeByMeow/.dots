---@diagnostic disable: redundant-parameter
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command('packadd packer.nvim')
end
return require('packer').startup({ function(use)
  use { 'wbthomason/packer.nvim' }
  use { "sainnhe/gruvbox-material", config = "require('plugins.configs.theme')" }

  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", event = "BufWinEnter", config = "require('plugins.configs.treesitter')" }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', event = "BufWinEnter", config = "require('plugins.configs.bufferline')" }
  use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
  use { 'norcalli/nvim-colorizer.lua', config = "require('plugins.configs.colorizer')", event = "BufRead" }
  use { 'glepnir/dashboard-nvim', config = "require('plugins.configs.dashboard')" }
  use { "lukas-reineke/indent-blankline.nvim", config = "require('plugins.configs.blankline')", event = "BufRead" }
  use { "folke/zen-mode.nvim", config = "require('plugins.configs.zen-mode')" }
  use { 'folke/twilight.nvim', config = "require('plugins.configs.twilight')" }
  use { 'glepnir/galaxyline.nvim', branch = 'main', config = "require('plugins.configs.galaxyline')", requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'b3nj5m1n/kommentary' }
  use { 'rcarriga/nvim-notify', config = "require('plugins.configs.nvim-notify')" }
  use { 'andymass/vim-matchup', require = 'nvim-treesitter/nvim-treesitter' }
  use { 'karb94/neoscroll.nvim', config = "require('plugins.configs.neoscroll')" }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup { current_line_blame = true } end
  }
  use { "akinsho/toggleterm.nvim", config = "require('plugins.configs.toggleterm')" }
  use { 'yamatsum/nvim-cursorline', config = "require('plugins.configs.cursorline')" }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = "require('plugins.configs.neo-tree')"
  }
  use { "max397574/better-escape.nvim", config = "require('plugins.configs.better-escape')" }
  use { 'ggandor/lightspeed.nvim' }

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, cmd = "Telescope", config = "require('plugins.configs.telescope')" }
  use { 'simrat39/symbols-outline.nvim', config = "require('plugins.configs.symbols')" }
  use { 'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" }
  use { 'windwp/nvim-autopairs', config = "require('plugins.configs.autopairs')" }

  use { 'williamboman/nvim-lsp-installer' }
  use { 'lukas-reineke/lsp-format.nvim', config = "require('plugins.configs.lspformat')" }
  use { 'neovim/nvim-lspconfig', config = "require('plugins.configs.lsp')" }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'tzachar/cmp-tabnine', run = './install.sh' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'onsails/lspkind-nvim' }
  use { 'tami5/lspsaga.nvim', config = "require('plugins.configs.lspsaga')" }
  use { 'antoyo/vim-licenses' }
  use { 'AndrewRadev/tagalong.vim' }
  use { 'tpope/vim-surround',
    keys = { "c", "d", "y" },
    config = "require('plugins.configs.surround')"
  }
  use { 'nacro90/numb.nvim', config = function() require('numb').setup() end }
  use { 'max-0406/autoclose.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'aserowy/tmux.nvim', config = "require('plugins.configs.tmux')" }
  use { 'jghauser/mkdir.nvim' }
  use { 'petertriho/nvim-scrollbar', config = function() require("scrollbar").setup() end }
  use { 'haringsrob/nvim_context_vt' }
  use {
    'yamatsum/nvim-nonicons',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = "require('plugins.configs.todo-comments')"
  }
  use({ "antoinemadec/FixCursorHold.nvim", event = "BufEnter" })
  use({ "folke/trouble.nvim", config = "require('plugins.configs.trouble')" })

  use({
    "sindrets/winshift.nvim",
    event = "BufRead",
    config = function()
      require("plugins.configs.winshift")
    end,
  })

  use({ "rmagatti/alternate-toggler", event = "BufRead" })
  use({
    "kevinhwang91/nvim-hlslens",
    keys = { "/" },
    config = function()
      require("hlslens").setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "auto",
      })
    end,
  })
  use({
    "beauwilliams/focus.nvim",
    event = "BufRead",
    config = function()
      require("focus").setup()
    end,
  })

  use({ 'linty-org/key-menu.nvim', config = "require('plugins.configs.key-menu')" })

  use { 'ray-x/lsp_signature.nvim', requires = { 'neovim/nvim-lspconfig' }, config = "require('plugins.configs.signature')" }
  use { "johmsalas/text-case.nvim",
    config = function()
      require('textcase').setup {}
    end
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
