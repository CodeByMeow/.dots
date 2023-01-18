local status, notify = pcall(require, 'notify')
if (not status) then return end

notify.setup {
    stages = "slide",
    timeout = 2000,
    minimum_width = 60,
    icons = {
        ERROR = "ERROR",
        WARN = "WARNING",
        INFO = "INFO",
        DEBUG = "DEBUG",
        TRACE = "TRACE",
    }
}

vim.notify = notify
