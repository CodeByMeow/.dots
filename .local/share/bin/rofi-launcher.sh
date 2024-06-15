#!/usr/bin/env sh

case "$1" in
    w)
        rofi -show window
        ;;
    d)
        rofi -show drun
        ;;
    h)
		rofi-gpaste
        ;;
	*)
		echo "Select options: w - window | d - drun | h - history"
esac
