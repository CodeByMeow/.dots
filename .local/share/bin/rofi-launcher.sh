#!/usr/bin/env sh

wallpaper_path=$(readlink "$HOME/.current_wallpaper")

check_file() {
    if [ ! -f "$1" ]; then
        echo "File $1 not found!"
        exit 1
    fi
}

check_file "$wallpaper_path"

rofi -show drun -theme-str "imagebox {background-image: url('$wallpaper_path', height);}"
