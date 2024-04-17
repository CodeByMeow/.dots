#!/bin/bash

updates=$(updates.sh)
count=$(echo "$updates" | wc -l)
tooltip=$(echo "$updates" | head -n 5 | sed 's/"/\\"/g' | awk -v RS="" '{gsub(/\n/,"\\n")}1')
class=""

if [ -z "$updates" ]; then
    icon=" "
    text="$icon"
    tooltip="There are no news for any repos, everything is up-to-date!"
elif [ "$count" -gt 0 ]; then
    icon=" "
    text="$icon$count"
	class="pending-updates"
	rest=$((count - 5))
	if [ "$rest" -gt 0 ]; then
        tooltip="$tooltip\\nand $rest updates available."
    fi
fi

echo '{"text":"'"$text"'", "tooltip":"'"$tooltip"'", "class":"'"$class"'"}'
