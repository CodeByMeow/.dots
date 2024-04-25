#!/usr/bin/env sh

wallpaper_path=$("getWallpaper.sh")

case "$1" in
    w)
        rofi -show window
        ;;
    d)
        rofi -show drun
        ;;
esac
