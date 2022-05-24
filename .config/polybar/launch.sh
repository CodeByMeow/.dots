#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

sleep 1;

polybar -q main >>/tmp/polybarMain.log 2>&1 &
