#!/usr/bin/env sh

case "$1" in
    w)
        rofi -show window
        ;;
    d)
        rofi -show drun
        ;;
    p)
        rofi -modi "power:power-menu.sh" -show power
        ;;
    *)
        echo "Select options: w - window | d - drun | p - power menu"
esac
