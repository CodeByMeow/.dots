require('tmux').setup {
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

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-h>', function() require('tmux').move_left() end, opts) 
vim.keymap.set('n', '<C-n>', function() require('tmux').move_bottom() end, opts)
vim.keymap.set('n', '<C-e>', function() require('tmux').move_top() end, opts)
