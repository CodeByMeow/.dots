#!/usr/bin/env sh

chosen=$(echo -e "Shutdown\nReboot\nLogout\nSuspend" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        i3-msg exit  # or bspc quit for BSPWM
        ;;
    Suspend)
        systemctl suspend
        ;;
esac
