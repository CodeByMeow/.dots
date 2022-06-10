local status_ok, notify = pcall(require, "notify")
local default = {
  stages = "fade",
  render = "default",
  timeout = 2000,
  minimum_width = 60,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "",
  },
}

notify.setup(default)

vim.notify = notify
