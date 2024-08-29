#!/bin/sh
#  ╔═╗╦ ╦╔╦╗╔═╗╔═╗╔╦╗╔═╗╦═╗╔╦╗
#  ╠═╣║ ║ ║ ║ ║╚═╗ ║ ╠═╣╠╦╝ ║
#  ╩ ╩╚═╝ ╩ ╚═╝╚═╝ ╩ ╩ ╩╩╚═ ╩

xset -dpms &
xset s noblank &
xset s off &
sxhkd &
blueman-applet &
xsetroot -cursor_name left_ptr &
pkill polybar &
$HOME/.config/polybar/launch.sh &
nitrogen --restore &
picom &
dunst &
unclutter -idle 10 &
udiskie &
ibus-daemon &
wezterm start -- tmux &
firefox &
exec bspwm
