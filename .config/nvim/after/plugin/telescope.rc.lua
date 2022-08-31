local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require "telescope.actions"

vim.g.theme_switcher_loaded = true

telescope.setup {
   defaults = {
      layout_config = {
         width = 0.75,
         prompt_position = "top",
         preview_cutoff = 120,
         horizontal = { mirror = false },
         vertical = { mirror = false }
      },
      find_command = {
         'rg',
         '--no-heading',
         '--with-filename',
         '--line-number',
         '--column',
         '--smart-case'
      },
      prompt_prefix = "  ",
      selection_caret = "󰆿 ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      file_sorter = require 'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
      path_display = {},
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
      buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
      mappings = {
         i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default + actions.center
         },
         n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["q"] = actions.close,
         }
      }
   }
}

local opts = {noremap = true, silent = true}
vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({no_ignore = false, hidden = true})<cr>', opts)
vim.keymap.set('n', ';r', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.keymap.set('n', '\\\\', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.keymap.set('n', ';t', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
vim.keymap.set('n', ';;', '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
vim.keymap.set('n', ';e', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)

