set fish_greeting
starship init fish | source
thefuck --alias | source

set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Asia/Ho_Chi_Minh
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user yes
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  

set -U Z_DATA "$HOME/.z"

alias vim="nvim"
export VISUAL="nvim"
export EDITOR="nvim"

#Misc
alias ls='lsd'
alias l='ls -l --header'
alias la='ls -la --header'
alias lt='l --tree'
alias g='git'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias setuntrack='config config --local status.showUnstrackedFiles no'
alias fz='rg --files | peco'
alias fk='fuck'
alias fck='fuck'

# Fish
alias fi='fisher install'
alias fl='fisher list'
alias fu='fisher update'
alias fr='fisher remove'

#Tmux
alias tks='tmux kill-server'            # Kill everything
alias tl='tmux list-sessions'           # List all of the open tmux sessions
alias tn='tmux new-session -s'          # Create a new tmux session - Specify a name
alias tk='tmux kill-session -a'         # Kill all of the OTHER tmux sessions
alias t='tmux attach || tmux new-session'   # Attaches tmux to the last session; creates a new session if none exists.
alias tpi='$HOME/.config/tmux/plugins/tpm/bin/install_plugins' # Installs Tmux plugins
alias tpu='$HOME/.config/tmux/plugins/tpm/bin/update_plugins all' # Updates all Tmux plugins

alias yt='ytfzf -ts --notify-playing'
alias sf='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify'

function k
    bluetoothctl connect DC:2C:26:0F:A5:D2
end

function nf 
    bash ~/.scripts/fetch.sh
end

function tap
    xinput set-prop "PNP0C50:00 04F3:30AA Touchpad" "libinput Tapping Enabled" 1
    echo "Tapping Enabled"
end

function mkfile
    mkdir -p $( dirname $argv) && touch $argv 
end

# Add this to your ~/.config/fish/config.fish
function rangercd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

source ~/.config/fish/themes/rose-pine.fish

