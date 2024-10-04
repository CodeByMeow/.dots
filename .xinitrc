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

# Start i3 and wait for it to be ready
i3 &
sleep 2  # Give i3 some time to initialize

# Kill existing polybar instances and launch it
pkill polybar
sleep 1  # Give time for existing instances to be killed
$HOME/.config/polybar/launch.sh &

# Set wallpaper
nitrogen --restore &

# Other startup applications
dunst &                           # Start notification daemon
blueman-applet &                  # Start Bluetooth applet
unclutter -idle 10 &              # Hide cursor when inactive
udiskie &                         # Automount removable media
wezterm start -- tmux &           # Start terminal emulator with tmux
(sleep 2 && firefox) &

# Keep the script running
wait
