set -U fish_greeting
set -Ux EDITOR nvim
set -Ux VISUAL nvim

set -x FZF_DEFAULT_OPTS "
--color=bg:#2d353b,bg+:#3a4248,fg:#d3c6aa,fg+:#e67e80
--color=hl:#a7c080,hl+:#7fbbb3
--color=info:#dbbc7f,prompt:#a7c080,pointer:#e67e80,marker:#e67e80,spinner:#dbbc7f
--border --height 40% --layout=reverse
"

fish_config theme choose Solarized\ Dark
fish_add_path -g ~/.node-modules/ ~/.node-modules/bin ~/.node-modules/ /share/man ~/.cargo/bin

