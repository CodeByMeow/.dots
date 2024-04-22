#!/usr/bin/env sh

wallpaper_path=$("getWallpaper.sh")

for opt in $@; do
    case "$opt" in
        w)
            rofi -show window -theme-str "imagebox {background-image: url('$wallpaper_path', height);}"
            ;;
        d)
            rofi -show drun -theme-str "imagebox {background-image: url('$wallpaper_path', height);}"
            ;;
    esac
done


