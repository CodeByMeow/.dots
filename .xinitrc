#!/bin/sh
#  ╔═╗╦ ╦╔╦╗╔═╗╔═╗╔╦╗╔═╗╦═╗╔╦╗
#  ╠═╣║ ║ ║ ║ ║╚═╗ ║ ╠═╣╠╦╝ ║
#  ╩ ╩╚═╝ ╩ ╚═╝╚═╝ ╩ ╩ ╩╩╚═ ╩

# Set cursor
xsetroot -cursor_name left_ptr &

# Display power management
xset -dpms &
xset s noblank &
xset s off &

# Start input method framework
ibus-daemon --xim &

# Set wallpaper
nitrogen --restore &

# Other startup applications
dunst &                           # Start notification daemon
blueman-applet &                  # Start Bluetooth applet
unclutter -idle 10 &              # Hide cursor when inactive
udiskie &                         # Automount removable media

# Start i3 (last line to prevent termination)
exec i3 &

# Launch terminal and browser
(sleep 1 && alacritty -e tmux) &
(sleep 1 && firefox) &

wait
