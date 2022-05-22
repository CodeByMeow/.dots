#!/bin/bash

network="$1"

data=$(nmcli | grep " connected" | wc -l)

if [[ "$data" = "0" ]]; then
    # Gruvbox
    echo "%{F#089CE5}睊 %{F#efdfb7}Offline"
else
    net=$(nmcli | grep " connected" | head -n 1 | awk '{print $4}')
    # Gruvbox
    echo "%{F#089CE5}直 %{F#efdfb7}$net"
fi
