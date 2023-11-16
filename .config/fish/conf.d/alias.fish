# Common
alias vim="nvim"
alias g="git"

# Tmux
alias tm="tmux"
alias ta="tm attach"
alias tks="tm kill-server"            # Kill everything
alias tl="tm list-sessions"           # List all of the open tmux sessions
alias tn="tm new-session -s"          # Create a new tmux session - Specify a name
alias tk="tm kill-session -a"         # Kill all of the OTHER tmux sessions
alias tpi="~/.config/tmux/plugins/tpm/bin/install_plugins" # Installs Tmux plugins
alias tpu="~/.config/tmux/plugins/tpm/bin/update_plugins all" # Updates all Tmux plugins

# Lsd
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
