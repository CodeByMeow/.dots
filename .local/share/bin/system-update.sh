#/bin/bash

aurhlpr='yay'
updates=$(updates.sh)

if [[ "$update" -gt 0 ]] ; then
    trap 'pkill -RTMIN+20 waybar' EXIT
    command="
	pfetch
	${updates}
    ${aurhlpr} -Syu
	notify-send 'Update system successfully'
    "
    kitty --title systemupdate sh -c "${command}"
else
	notify-send "There are no news for any repos, everything is up-to-date!"
fi
