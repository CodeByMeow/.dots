#!/bin/bash

# Set the weather codes
declare -A WEATHER_CODES=(
    [113]="☀️"
    [116]="🌤️"
    [119]="☁️"
    [122]="🌥️"
    [143]="🌫️"
    [176]="🌦️"
    [179]="🌧️"
    [182]="🌨️"
    [185]="🌨️"
    [200]="🌩️"
    [227]="❄️"
    [230]="❄️"
    [248]="🌫️"
    [260]="🌫️"
    [263]="🌧️"
    [266]="🌧️"
    [281]="🌦️"
    [284]="🌦️"
    [293]="🌧️"
    [296]="🌧️"
    [299]="🌧️"
    [302]="🌧️"
    [305]="🌧️"
    [308]="🌧️"
    [311]="🌧️"
    [314]="🌧️"
    [317]="🌧️"
    [320]="🌨️"
    [323]="🌨️"
    [326]="🌨️"
    [329]="🌨️"
    [332]="🌨️"
    [335]="🌨️"
    [338]="🌨️"
    [350]="🌨️"
    [353]="🌧️"
    [356]="🌧️"
    [359]="🌧️"
    [362]="🌨️"
    [365]="🌨️"
    [368]="🌨️"
    [371]="🌨️"
    [374]="🌨️"
    [377]="🌨️"
    [386]="🌩️"
    [389]="🌨️"
    [392]="🌨️"
    [395]="🌨️"
    [398]="🌨️"
    [401]="🌨️"
    [404]="🌨️"
    [407]="🌨️"
    [410]="🌨️"
    [413]="🌨️"
    [416]="🌨️"
    [419]="🌨️"
    [422]="🌨️"
    [425]="🌨️"
    [428]="🌨️"
    [431]="🌨️"
)

ICON_PLACEHOLDER="{ICON}"

# Parse command line arguments
ARGS=()
for arg in "$@"; do
    case $arg in
        --lang=*)
            LANG="${arg#*=}"
            ;;
        --location=*)
            LOCATION="${arg#*=}"
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
done

# Set the language
case "${LANG:-en}" in
    en)
        LANG_WTTR_IN_SUBDOMAIN="wttr.in"
        LANG_WEATHER_DESC="weatherDesc"
        LANG_FEELS_LIKE="Feels like"
        LANG_WIND="Wind"
        LANG_HUMIDITY="Humidity"
        LANG_LOCATION="Location"
        LANG_TODAY="Today"
        LANG_TOMORROW="Tomorrow"
        ;;
        # Add other languages here
    *)
        LANG_WTTR_IN_SUBDOMAIN="wttr.in"
        LANG_WEATHER_DESC="weatherDesc"
        LANG_FEELS_LIKE="Feels like"
        LANG_WIND="Wind"
        LANG_HUMIDITY="Humidity"
        LANG_LOCATION="Location"
        LANG_TODAY="Today"
        LANG_TOMORROW="Tomorrow"
        ;;
esac

# Build the weather URL
WEATHER_URL="https://${LANG_WTTR_IN_SUBDOMAIN}/${LOCATION:-}?format=j1"
CACHEFILE="/tmp/wttrbar-${LOCATION:-}.json"

# Check if the cache file is recent
if [ -f "$CACHEFILE" ]; then
    TEN_MINUTES_AGO=$(date -d '-10 minutes' +%s)
    CACHE_FILE_MODIFIED=$(date -r "$CACHEFILE" +%s)
    if [ "$CACHE_FILE_MODIFIED" -gt "$TEN_MINUTES_AGO" ]; then
        IS_CACHE_FILE_RECENT=true
    else
        IS_CACHE_FILE_RECENT=false
    fi
else
    IS_CACHE_FILE_RECENT=false
fi

# Fetch and cache the weather data
if $IS_CACHE_FILE_RECENT; then
    WEATHER_DATA=$(cat "$CACHEFILE")
else
    ITERATIONS=0
    THRESHOLD=20
    while true; do
        WEATHER_DATA=$(curl -s "$WEATHER_URL")
        if [ $? -eq 0 ]; then
            break
        else
            ITERATIONS=$((ITERATIONS + 1))
            sleep $((500 * ITERATIONS))ms

            if [ "$ITERATIONS" -eq "$THRESHOLD" ]; then
                echo '{"text":"⛓️‍💥", "tooltip":"cannot access wttr.in"}'
                exit 0
            fi
        fi
    done
    echo "$WEATHER_DATA" > "$CACHEFILE"
fi

# Parse the weather data
CURRENT_CONDITION=$(echo "$WEATHER_DATA" | jq '.current_condition[0]')
FEELS_LIKE=$(echo "$CURRENT_CONDITION" | jq -r ".FeelsLikeC")
WEATHER_CODE=$(echo "$CURRENT_CONDITION" | jq -r '.weatherCode')
WEATHER_ICON="${WEATHER_CODES[$WEATHER_CODE]}"

# Format the text
INDICATOR=$(echo "$CURRENT_CONDITION" | jq -r ".temp_C")
TEXT="$WEATHER_ICON $INDICATOR"

# Build the tooltip
TOOLTIP="<b>$(echo "$CURRENT_CONDITION" | jq -r ".[\"$LANG_WEATHER_DESC\"][0].value")</b> $(echo "$CURRENT_CONDITION" | jq -r ".temp_C")°\n"
TOOLTIP+="$LANG_FEELS_LIKE: $FEELS_LIKE°\n"
TOOLTIP+="$LANG_WIND: $(echo "$CURRENT_CONDITION" | jq -r '.windspeedKmph') Km/h\n"
TOOLTIP+="$LANG_HUMIDITY: $(echo "$CURRENT_CONDITION" | jq -r '.humidity')%\n"
NEAREST_AREA=$(echo "$WEATHER_DATA" | jq '.nearest_area[0]')
TOOLTIP+="$LANG_LOCATION: $(echo "$NEAREST_AREA" | jq -r '.areaName[0].value'), $(echo "$NEAREST_AREA" | jq -r '.country[0].value')\n"

echo '{"text": "'"$TEXT"'", "tooltip":"'"$TOOLTIP"'"}'
