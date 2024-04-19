#!/usr/bin/env bash
_ps=(waybar rofi swaync pywalfox)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

# Relaunch swaync
sleep 0.2
swaync > /dev/null 2>&1 &

sleep 0.2
# Relaunch hypr
hyprBorder.sh > /dev/null 2>&1 &

sleep 0.2
# Relaunch waybar
waybar > /dev/null 2>&1 &

sleep 0.2
# Relaunch firefox
pywalfox update > /dev/null 2>&1 &

sleep 0.2
# Renew hyprlock color
hyprColor.sh > /dev/null 2>&1 &

sleep 0.2
# Renew hyprlock color
tmuxColor.sh > /dev/null 2>&1 &

# for cava-pywal (note, need to manually restart cava once wallpaper changes)
ln -sf "$HOME/.cache/wal/cava-colors" "$HOME/.config/cava/config" || true

exit 0
