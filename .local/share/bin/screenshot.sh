#!/bin/bash
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
LS="/usr/bin/ls"

mkdir -p "$SCREENSHOT_DIR"

flameshot gui -r -p "$SCREENSHOT_DIR" | xclip -selection clipboard -t image/png

latest_screenshot=$("$LS" -t "$SCREENSHOT_DIR" | head -n1)

notify-send -u low -i "$SCREENSHOT_DIR/$latest_screenshot" "Screenshot saved to clipboard"
