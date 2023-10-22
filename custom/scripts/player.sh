#!/usr/bin/env sh
declare -A options=(
    ["next"]="怜"
    ["previous"]="玲"
    ["play-pause"]="懶"
)
if [[ -z "$1" ]]; then
    for cmd in "${!options[@]}"; do
        echo "${options[$cmd]} $cmd"
    done
else
    if [[ -n $1 ]]; then
        input="$1"
        IFS=" " read -r -a array <<< "$input"
        cmd="${array[1]}"
        playerctl $cmd
    else
        echo "Invalid command: $1"
    fi
fi
