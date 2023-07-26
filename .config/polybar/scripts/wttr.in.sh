#!/bin/bash

response=$(curl -s https://ipinfo.io/loc)
lat=$(echo $response | cut -d ',' -f 1)
lon=$(echo $response | cut -d ',' -f 2)

location_info=$(curl -s "https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lon}")

region_name=$(echo $location_info | jq -r '.address.city // .address.town // .address.village // .address.county // .address.state // .address.country')

weather_info=$(curl -s "https://vi.wttr.in/?format=%C+%t+%w" --get --data "latlon=${lat},${lon}")

echo "$region_name: $weather_info"

