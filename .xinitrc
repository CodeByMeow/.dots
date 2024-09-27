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
fcitx5 &

# Start window manager in the background
exec i3 &

# Set wallpaper
nitrogen --restore &

# Kill existing polybar instances and launch it
pkill polybar
$HOME/.config/polybar/launch.sh &

# Start notification daemon
dunst &

# Start Bluetooth applet
blueman-applet &

# Hide cursor when inactive
unclutter -idle 10 &

# Automount removable media
udiskie &

# Start terminal emulator with tmux
wezterm start -- tmux &

# Start web browser
firefox &

# Keep the script running
wait
