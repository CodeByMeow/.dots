#!/usr/bin/env sh

# Launch Rofi
MENU="$(rofi -no-lazy-grab -sep "|" -dmenu \
-hide-scrollbar true \
-bw 0 \
-theme-str "*{font: \"Iosevka Nerd Font 14\";}\
window {width: 230; height: 150;} \
mainbox {children: [listview];} \
element-text{horizontal-align: 0;}"\
<<< "怜  Next| Toggle|玲  Previous")"
case "$MENU" in
    *Next) playerctl next ;;
    *Toggle) playerctl play-pause ;;
    *Previous) playerctl  previous
esac


