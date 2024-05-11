#!/usr/bin/env bash

notif="$HOME/.config/swaync/thankme.png"

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
	hyprctl keyword general:layout dwindle
	hyprctl keyword bind SUPER,O,togglesplit
  notify-send -e -u low -i "$notif" "Dwindle Layout"
	;;
"dwindle")
	hyprctl keyword general:layout master
	hyprctl keyword unbind SUPER,O
  notify-send -e -u low -i "$notif" "Master Layout"
	;;
*) ;;

esac
