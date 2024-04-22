#!/usr/bin/env sh

# Check if the host is a laptop using upower
laptop_check=$(acpi -p 2>/dev/null)

if [ -z "$laptop_check" ]; then
    # Host is likely a desktop
    monitor_scale=1
else
    # Host is likely a laptop
    monitor_scale=1.5
fi

if [ "$1" ];then
    monitor_scale=$1
fi

# Set the monitor scale using hyprctl
hyprctl keyword monitor ",preferred,auto,$monitor_scale"
