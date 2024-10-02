#!/usr/bin/env sh

chosen=$(echo -e "Shutdown\nReboot\nSuspend" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
esac
