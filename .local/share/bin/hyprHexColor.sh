source "${HOME}/.cache/wal/colors.sh"

function hyprhex() {
    hex_color="$1"
    clean_hex_color=$(echo $hex_color | sed 's/#//')
    hypr_hex=("0xff$clean_hex_color")
    echo $hypr_hex
}

# hypr hex
hypr_background=$(hyprhex "$background")
hypr_foreground=$(hyprhex "$foreground")
hypr_cursor=$(hyprhex "$cursor")

hypr_color0=$(hyprhex "$color0")
hypr_color1=$(hyprhex "$color1")
hypr_color2=$(hyprhex "$color2")
hypr_color3=$(hyprhex "$color3")
hypr_color4=$(hyprhex "$color4")
hypr_color5=$(hyprhex "$color5")
hypr_color6=$(hyprhex "$color6")
hypr_color7=$(hyprhex "$color7")
hypr_color8=$(hyprhex "$color8")
hypr_color9=$(hyprhex "$color9")
hypr_color10=$(hyprhex "$color10")
hypr_color11=$(hyprhex "$color11")
hypr_color12=$(hyprhex "$color12")
hypr_color13=$(hyprhex "$color13")
hypr_color14=$(hyprhex "$color14")
hypr_color15=$(hyprhex "$color15")
