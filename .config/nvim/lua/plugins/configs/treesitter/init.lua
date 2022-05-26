require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "javascript", "lua", "css", "php" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = {
    enable = true
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
  },
  refactor = {
    highlight_definitions = {
      enable = false,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<leader>td",
        list_definitions = "<leader>tl",
      },
    },
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
