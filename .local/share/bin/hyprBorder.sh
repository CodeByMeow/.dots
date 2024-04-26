#!/usr/bin/env sh

source "hyprHexColor.sh"

hyprctl keyword general:col.active_border $hypr_color1 $hypr_color2  $hypr_color3 $hypr_color4 $hypr_color5 $hypr_color6 $hypr_color7 270deg
hyprctl keyword general:col.inactive_border $hypr_color1
