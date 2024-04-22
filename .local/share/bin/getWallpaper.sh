#!/usr/bin/env bash

wallpaper_path=$(readlink "$HOME/.current_wallpaper")

check_file() {
    if [ ! -f "$1" ]; then
        echo "File $1 not found!"
        exit 1
    fi
}

check_file "$wallpaper_path"

echo $wallpaper_path
