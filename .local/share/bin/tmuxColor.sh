#!/bin/bash

# Update tmux configuration with colors from Pywal
tmux_conf="$HOME/.config/tmux/conf/status.conf"

cat > "$tmux_conf" <<EOF
set -g status "on"
set -g status-interval 1
set -g status-justify "left"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-right '%A %d/%m/%Y #{tmux_mode_indicator}'
set -g mode-style "fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color15')"
set -g message-style "fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
set -g message-command-style "fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
set -g pane-border-style "fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
set -g pane-active-border-style "fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color3')"
set -g status-style "fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
set -g status-bg "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
set -g status-left "#[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color8'),bold] #(whoami) #[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color8'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')]"
setw -g window-status-format '#[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color1')]#[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color1')] #I  #{b:pane_current_path} #[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color1'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0'),nobold,nounderscore,noitalics]'
setw -g window-status-current-format '#[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7')]#[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color3'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color15')] #I #[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color15'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color3')] #{b:pane_current_path} #[fg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color3'),bg=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0'),nobold]'
EOF

tmux source-file $HOME/.config/tmux/tmux.conf

exit 0

