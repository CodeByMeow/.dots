# add to ~/.config/fish/config.fish
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH:$HOME/.local/share/bin"
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/"
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export EDITOR=nvim
export BROWSER='/usr/bin/zen-browser'
export PROVIDER='ollama'
export MODEL=mistral
export TASKRC="$HOME/.taskrc"
export TASKDATA="$HOME/tasks"

