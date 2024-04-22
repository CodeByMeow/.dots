#!/usr/bin/env bash

wallpaper_path=$("getWallpaper.sh")

for opt in $@; do
    case "$opt" in
        no-tty)
            # Do not change terminal colors
            sleep 0.5
            wal -i "$wallpaper_path" -s -t
            ;;
        *)
            sleep 0.5
            wal -i "$wallpaper_path"
            ;;
    esac
done
