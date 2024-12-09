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
exec i3 &
# Wait for i3 to start
while ! pgrep -x "i3" > /dev/null; do
    sleep 0.1
done

$HOME/.config/polybar/launch.sh &

# Set wallpaper
nitrogen --restore &

# Other startup applications
dunst &                           # Start notification daemon
blueman-applet &                  # Start Bluetooth applet
unclutter -idle 10 &              # Hide cursor when inactive
udiskie &                         # Automount removable media
alacritty -e tmux &           # Start terminal emulator with tmux
(sleep 2 && firefox) &

# Keep the script running
wait
