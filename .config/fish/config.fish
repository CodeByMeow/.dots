set fish_greeting
starship init fish | source

alias ls='logo-ls'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lr='ls -R'
alias g='git'
alias vim='nvim'
alias tm='tmux'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias setuntrack='config config --local status.showUnstrackedFiles no'
alias cra="create-react-app"

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

function k
  bluetoothctl connect DC:2C:26:0F:A5:D2
end

export VISUAL=nvim;
export EDITOR=nvim;

function nf 
  bash ~/.scripts/fetch.sh
end
set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $PATH $NPM_PACKAGES/bin

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

function tap
  xinput set-prop "PNP0C50:00 04F3:30AA Touchpad" "libinput Tapping Enabled" 1
end

$HOME/.welcome/welcome.sh
