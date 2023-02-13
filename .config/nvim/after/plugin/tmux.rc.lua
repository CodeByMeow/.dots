local status, tmux = pcall(require, 'tmux')
if (not status) then return end

tmux.setup {
    copy_sync = {
        enable = true,
    },
    navigation = {
        enable_default_keybindings = false,
    },
    resize = {
        enable_default_keybindings = false,
    }
}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<C-h>', function()
    tmux.move_left()
end, opts)
map('n', '<C-n>', function()
    tmux.move_bottom()
end, opts)
map('n', '<C-e>', function()
    tmux.move_top()
end, opts)
