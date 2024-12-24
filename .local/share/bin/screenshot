#!/bin/bash

# Directory to store screenshots
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Ensure the screenshot directory exists
mkdir -p "$SCREENSHOT_DIR"

# Generate a timestamped filename
SCREENSHOT_FILE="screenshot_$(date +%Y%m%d_%H%M%S).png"
FULL_PATH="$SCREENSHOT_DIR/$SCREENSHOT_FILE"

# Take screenshot
maim -s "$FULL_PATH"

# Check if screenshot was successful
if [ $? -eq 0 ]; then
    # Copy to clipboard
    xclip -selection clipboard -t image/png < "$FULL_PATH"

    # Send notification with the screenshot as an icon
    notify-send -i "$FULL_PATH" "Screenshot Captured" "Saved to $FULL_PATH"
else
    # Remove the empty/invalid file if screenshot was cancelled
    rm -f "$FULL_PATH"

    # Send a simple notification without referencing any file path
    notify-send -u low "Screenshot Cancelled"
fi
