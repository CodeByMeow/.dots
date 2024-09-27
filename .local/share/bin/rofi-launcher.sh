#!/usr/bin/env sh

case "$1" in
    w)
        rofi -show window
        ;;
    d)
        rofi -show drun
        ;;
    p)
        power-menu.sh
        ;;
    *)
        echo "Select options: w - window | d - drun | p - power menu"
esac
