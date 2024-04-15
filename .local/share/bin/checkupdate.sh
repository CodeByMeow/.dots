#!/bin/bash

updates=$(checkupdates 2> /dev/null)
count=$(echo "$updates" | wc -l)
tooltip=$(echo "$updates" | head -n 5 | sed 's/"/\\"/g' | awk -v RS="" '{gsub(/\n/,"\\n")}1')
class=""

if [ -z "$updates" ]; then
    icon=" "
    text="$icon"
elif [ "$count" -gt 0 ]; then
    icon=" "
    text="$icon$count"
	class="pending-updates"
fi

echo '{"text":"'"$text"'", "tooltip":"'"$tooltip"'", "class":"'"$class"'"}'
