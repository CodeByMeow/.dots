local present, notify = pcall(require, "notify")

if not present then
  return
end

local options = {
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
  }
}

notify.setup(options)

vim.notify = notify
