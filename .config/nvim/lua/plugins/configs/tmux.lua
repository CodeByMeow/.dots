local present, tmux = pcall(require, "tmux")
if not present then
    return
end

local options = {
    copy_sync = {
        enable = true,
    },
    navigation = {
        enable_default_keybindings = true,
    },
    resize = {
        enable_default_keybindings = false,
    }
}
tmux.setup(options)
