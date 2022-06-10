local status_ok, tmux = pcall(require, "tmux")
if status_ok then
  tmux.setup({
    copy_sync = {
      enable = true,
    },
    navigation = {
      enable_default_keybindings = true,
    },
    resize = {
      enable_default_keybindings = false,
    }
  });
end
