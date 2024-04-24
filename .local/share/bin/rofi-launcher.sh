#!/usr/bin/env sh

wallpaper_path=$("getWallpaper.sh")

case "$1" in
    w)
        rofi -show window -theme-str "imagebox {background-image: url('$wallpaper_path', height);}"
        ;;
    d)
        rofi -show drun -theme-str "imagebox {background-image: url('$wallpaper_path', height);}"
        ;;
    c)
        cliphist list | rofi -dmenu -theme-str "imagebox {background-image: url('$wallpaper_path', height);}" | cliphist decode | wl-copy
        ;;
esac
