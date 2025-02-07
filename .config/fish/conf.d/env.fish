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

set -x FZF_DEFAULT_OPTS "
--color=bg:#2d353b,bg+:#3a4248,fg:#d3c6aa,fg+:#e67e80
--color=hl:#a7c080,hl+:#7fbbb3
--color=info:#dbbc7f,prompt:#a7c080,pointer:#e67e80,marker:#e67e80,spinner:#dbbc7f
--border --height 40% --layout=reverse
"
