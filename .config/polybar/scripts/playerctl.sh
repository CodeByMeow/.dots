#!/bin/bash

# Maximum length for the title
max_length=20

# Get the title and artist of the currently playing media using Playerctl
title=$(playerctl metadata --format "{{ title }}")
artist=$(playerctl metadata --format "{{ artist }}")

# Truncate the title if it exceeds the maximum length
if [ ${#title} -gt $max_length ]; then
    title=${title:0:$max_length}...
fi

# Print the title and artist
echo "$title - $artist"

