-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rose/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rose/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rose/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rose/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rose/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["autoclose.nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/max-0406/autoclose.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('plugins.config.bufferline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    config = { "require('plugins.config.dashboard')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "require('plugins.config.galaxyline')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "require('plugins.config.theme')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('plugins.config.blankline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { "require('plugins.config.lspformat')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "require('plugins.config.signature')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "require('plugins.config.lspsaga')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "require('plugins.config.neo-tree')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugins.config.autopairs')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('plugins.config.colorizer')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { "require('plugins.config.cursorline')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "require('plugins.config.lsp')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "require('plugins.config.nvim-notify')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag", "nvim-ts-rainbow" },
    config = { "require('plugins.config.treesitter')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "require('plugins.config.icon')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "require('plugins.config.symbols')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/tagalong.vim",
    url = "https://github.com/AndrewRadev/tagalong.vim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('plugins.config.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "require('plugins.config.tmux')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('plugins.config.toggleterm')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["twilight.nvim"] = {
    config = { "require('plugins.config.twilight')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-licenses"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/vim-licenses",
    url = "https://github.com/antoyo/vim-licenses"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-surround"] = {
    config = { "require('plugins.config.surround')" },
    keys = { { "", "c" }, { "", "d" }, { "", "y" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-titlecase"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/vim-titlecase",
    url = "https://github.com/christoomey/vim-titlecase"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "require('plugins.config.whichkey')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rose/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "require('plugins.config.zen-mode')" },
    loaded = true,
    path = "/home/rose/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require('plugins.config.lspsaga')
time([[Config for lspsaga.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
require('plugins.config.tmux')
time([[Config for tmux.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require('plugins.config.nvim-notify')
time([[Config for nvim-notify]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
require('plugins.config.neo-tree')
time([[Config for neo-tree.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('plugins.config.toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
require('plugins.config.theme')
time([[Config for gruvbox.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
require('plugins.config.twilight')
time([[Config for twilight.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require('plugins.config.icon')
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('plugins.config.autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
require('plugins.config.symbols')
time([[Config for symbols-outline.nvim]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
require('plugins.config.lspformat')
time([[Config for lsp-format.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require('plugins.config.galaxyline')
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
require('plugins.config.cursorline')
time([[Config for nvim-cursorline]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
require('plugins.config.signature')
time([[Config for lsp_signature.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('plugins.config.dashboard')
time([[Config for dashboard-nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require('plugins.config.zen-mode')
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('plugins.config.lsp')
time([[Config for nvim-lspconfig]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> d <cmd>lua require("packer.load")({'vim-surround'}, { keys = "d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> y <cmd>lua require("packer.load")({'vim-surround'}, { keys = "y", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> c <cmd>lua require("packer.load")({'vim-surround'}, { keys = "c", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'bufferline.nvim', 'which-key.nvim', 'nvim-treesitter'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
