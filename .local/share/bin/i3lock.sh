#!/bin/bash

# Path to nitrogen background config
CONFIG_FILE="$HOME/.config/nitrogen/bg-saved.cfg"

# Extract current background from nitrogen config
current_bg=$(grep '^file=' "$CONFIG_FILE" | cut -d'=' -f2)

# Everforest color palette
bg_dim="#232A2E"
bg0="#2D353B"
bg1="#343F44"
bg2="#3D484D"
green="#A7C080"
text="#D3C6AA"

# Lock with i3lock, using Everforest-inspired colors
i3lock \
    --image="$current_bg" \
    --tiling \
    --clock \
    --insidever-color=$bg1 \
    --insidewrong-color=$bg1 \
    --inside-color=$bg0 \
    --ringver-color=$green \
    --ringwrong-color="#E67E80" \
    --ringver-color=$green \
    --ring-color=$bg2 \
    --line-uses-inside \
    --keyhl-color="#DBBC7F" \
    --bshl-color="#E67E80" \
    --separator-color=$bg2 \
    --verif-color=$text \
    --wrong-color=$text \
    --layout-color=$text \
    --date-color=$text \
    --time-color=$text \
    --time-font="JetBrains Mono" \
    --date-font="JetBrains Mono" \
    --time-size=42 \
    --date-size=24 \
    --radius=120 \
    --ring-width=20 \
    --indicator
