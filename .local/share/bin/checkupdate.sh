#!/bin/bash

updates=$(checkupdates 2> /dev/null)
count=$(echo "$updates" | wc -l)
tooltip=$(echo "$updates" | head -n 5 | sed 's/^ *//;s/ *$//')

if [ -z "$update" ]; then
    icon=" "
    text="$icon"
elif [ "$count" -gt 0 ]; then
    icon=" "
    text="$icon$count"
fi

echo '{"text":"'"$text"'", "tooltip":"'"$tooltip"'"}'
