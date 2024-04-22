#!/usr/bin/env bash

# Get public IP address
ip=$(curl -s ifconfig.me)

# Get location information based on the IP address
location=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.city + ", " + .region + ", " + .country')
latitude=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.loc' | cut -d ',' -f 1)
longitude=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.loc' | cut -d ',' -f 2)

# Get weather information based on the latitude and longitude
weather=$(curl -s "wttr.in/$latitude,$longitude?format=%c%t|%l+(%c%f)+%h,+%C")

# Extract city name from location
city=$(echo "$location" | cut -d ',' -f 1)

# Extract bar and tooltip from weather information
bar=$(echo $weather | awk -F "|" '{print $1}')
tooltip="$city: $(echo $weather | awk -F "|" '{print $2}')"

# Print the bar text and tooltip in JSON format
echo "{\"text\":\"$bar\", \"tooltip\":\"$tooltip\"}"
