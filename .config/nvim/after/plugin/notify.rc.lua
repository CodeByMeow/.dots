local status, notify = pcall(require, 'notify')
if (not status) then return end

notify.setup {
    stages = "fade",
    render = "default",
    timeout = 2000,
    minimum_width = 60,
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "",
    }
}

vim.notify = notify
