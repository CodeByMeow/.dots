#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

sleep 1;

polybar -q workspace >>/tmp/polybarA.log 2>&1 &
polybar -q datetimeI >>/tmp/polybarB.log 2>&1 &
polybar -q network >>/tmp/polybarC.log 2>&1 &
polybar -q volume >>/tmp/polybarD.log 2>&1 &
polybar -q keyboard >>/tmp/polybarE.log 2>&1 &
polybar -q checkupdates >>/tmp/polybarF.log 2>&1 &
polybar -q powerLight >>/tmp/polybarG.log 2>&1 &
