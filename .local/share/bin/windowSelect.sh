#!/bin/bash

WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", ""); $1=$1; print}' | rofi -dmenu -p "Choose a window: ")

if [ -z "$WINDOW" ]; then
    exit
fi

hyprctl dispatch focuswindow "$WINDOW"
