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

# Start key handler daemon (should be started before window manager)
sxhkd &

sleep 1

# Start input method framework
ibus-daemon -drx &

sleep 1

# Start window manager
bspwm &

sleep 2

# Start compositor
picom &

sleep 1

# Set wallpaper
nitrogen --restore &

# Kill existing polybar instances
pkill polybar

sleep 1

# Launch polybar
$HOME/.config/polybar/launch.sh &

sleep 1

# Start notification daemon
dunst &

# Start Bluetooth applet
blueman-applet &

# Hide cursor when inactive
unclutter -idle 10 &

# Automount removable media
udiskie &

sleep 2

# Start terminal emulator with tmux
wezterm start -- tmux &

sleep 2

# Start web browser
firefox &

# Keep the script running
wait
