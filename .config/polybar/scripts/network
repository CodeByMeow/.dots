#!/bin/bash

network="$1"

data=$(nmcli | grep " connected" | wc -l)

if [[ "$data" = "0" ]]; then
    echo "Offline"
else
    net=$(nmcli | grep " connected" | head -n 1 | awk '{print $4}')
    echo "$net"
fi
