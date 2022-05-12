local cfg = {
  debug = false,
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
  verbose = false,
  bind = true,
  doc_lines = 10,
  floating_window = true,
  floating_window_above_cur_line = true,
  floating_window_off_x = 1,
  floating_window_off_y = 1,
  fix_pos = false,
  hint_enable = true,
  hint_prefix = "  ",
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter",
  max_height = 12,
  max_width = 80,
  handler_opts = {
    border = "rounded"
  },
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,
  padding = '',
  transparency = nil,
  shadow_blend = 36,
  shadow_guibg = 'Black',
  timer_interval = 200,
  toggle_key = nil
}
require 'lsp_signature'.setup(cfg)
require 'lsp_signature'.on_attach(cfg)
