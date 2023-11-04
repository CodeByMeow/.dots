#!/usr/bin/env sh

# Launch Rofi
MENU="$(rofi -no-lazy-grab -sep "|" -dmenu \
-hide-scrollbar true \
-location 2 \
-xoffset -210 -yoffset 50 \
-bw 0 \
-selected-row 1 \
-theme-str \
"*{font: \"Iosevka Nerd Font Italic 14\";}\
window {width: 300;} \
mainbox {children: [listview];} \
listview {columns: 3; lines: 1;} \
element selected {text-color: #fdf6e3; } \
" \
<<< "  TOG|怜 NEXT")"
case "$MENU" in
    *TOG ) playerctl play-pause ;;
    *NEXT) playerctl  next
esac


