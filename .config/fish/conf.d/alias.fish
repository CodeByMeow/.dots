# Common
alias vim="nvim"
alias g="git"

# Tmux
alias tm="tmux"
alias ta="tm attach"
alias tpi="~/.config/tmux/plugins/tpm/bin/install_plugins" # Installs Tmux plugins
alias tpu="~/.config/tmux/plugins/tpm/bin/update_plugins all" # Updates all Tmux plugins

# Lsd
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

# translate shell
alias t="trans :vi -b"

# Pacman
alias httpsmirrors="rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist"
