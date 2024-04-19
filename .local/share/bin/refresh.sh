#!/usr/bin/env bash
_ps=(waybar swaync)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

# Relaunch swaync
sleep 0.2
swaync > /dev/null 2>&1 &
waybar > /dev/null 2>&1 &

pywalfox update > /dev/null 2>&1 &
hyprBorder.sh > /dev/null 2>&1 &
hyprColor.sh > /dev/null 2>&1 &
tmuxColor.sh > /dev/null 2>&1 &

# for cava-pywal (note, need to manually restart cava once wallpaper changes)
ln -sf "$HOME/.cache/wal/cava-colors" "$HOME/.config/cava/config" || true

exit 0
