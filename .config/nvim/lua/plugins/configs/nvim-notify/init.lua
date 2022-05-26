local notify = require("notify")
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

vim.notify = function(msg, level)
  notify(msg, level)
end

function _G.P(...)
  print(vim.inspect(...))
  return ...
end

vim.notify = require("notify")
