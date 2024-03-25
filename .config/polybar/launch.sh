#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

sleep 1;

polybar -q workspace &
polybar -q cpu &
polybar -q memory &
polybar -q cava &
polybar -q player &
polybar -q weather &
polybar -q tray &
polybar -q system &
polybar -q time &
polybar -q powermenu &

if [[ -n "$EXM" ]]; then
	polybar -q extend_workspace
fi
