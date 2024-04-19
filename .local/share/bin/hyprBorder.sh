#!/bin/bash

source "${HOME}/.cache/wal/colors.sh"

function walhex() {
    hex_color="$1"
    clean_hex_color=$(echo $hex_color | sed 's/#//')
    hypr_hex=("0xff$clean_hex_color")
    echo $hypr_hex
}


hyprctl keyword general:col.active_border $(walhex $color4) $(walhex $color5)  $(walhex $color6) $(walhex $color7) $(walhex $color8) 270deg
hyprctl keyword general:col.inactive_border $(walhex $color2)
