#!/usr/bin/env sh

# Launch Rofi
MENU="$(rofi -no-lazy-grab -sep "|" -dmenu \
-hide-scrollbar true \
-location 2 \
-xoffset -210 -yoffset 50 \
-bw 0 \
-theme-str \
"*{font: \"Iosevka Nerd Font Italic 14\";}\
window {width: 360; height: 50;} \
mainbox {children: [listview];} \
element {padding: 2; horizontal-align: 0.5;} \
listview {columns: 3; margin: 5;} \
element selected {text-color: #fdf6e3; } \
" \
<<< "玲 PREV |  TOG|怜 NEXT")"
case "$MENU" in
    *PREV) playerctl previous ;;
    *TOG ) playerctl play-pause ;;
    *NEXT) playerctl  next
esac


