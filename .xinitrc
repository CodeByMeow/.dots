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
# ibus-daemon --xim &
fcitx5 -d &

# Other startup applications
dunst &                           # Start notification daemon
blueman-applet &                  # Start Bluetooth applet
unclutter -idle 10 &              # Hide cursor when inactive
udiskie &                         # Automount removable media

# Start i3 (last line to prevent termination)
exec i3

