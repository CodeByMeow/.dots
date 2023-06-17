#!/bin/bash

playing=$(playerctl status 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null | cut -c 1-25)
artist=$(playerctl metadata artist 2>/dev/null | cut -c 1-20)

if [[ "$playing" == "Playing" && -n "$title" ]]; then
    echo "%{T2}🎙️ $artist - $title"
fi

