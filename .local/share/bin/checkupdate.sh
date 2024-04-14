#!/bin/bash

updates=$(checkupdates 2> /dev/null)
count=$(echo "$updates" | wc -l)
tooltip=$(echo "$updates" | head -n 5 | sed 's/^/    /')

if [ "$count" -gt 0 ]; then
    icon=" "
    text="$icon $count"
else
    icon=" "
    text="$icon"
fi

echo '{"text":"'"$text"'", "tooltip":"'"$tooltip"'"}'
