#/bin/bash

aurhlpr='yay'
updates=$(updates.sh)
count=$(echo "$updates" | wc -l)

if [ -z "$updates" ]; then
	notify-send "There are no news for any repos, everything is up-to-date!"
elif [[ "$count" -gt 0 ]] ; then
    trap 'pkill -RTMIN+20 waybar' EXIT
    command="
	pfetch
	${updates}
    ${aurhlpr} -Syu
	notify-send 'Update system successfully'
    "
    kitty --title systemupdate sh -c "${command}"
fi
