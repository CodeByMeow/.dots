#========Welcome=======#
welcome () {
  msg="Welcome" # Default

  if command -v whoami &>/dev/null ; then
    usr=$(whoami)
  elif command -v id &>/dev/null; then
    usr=$(id -u -n)
  else
    usr=$USER
  fi

  if [ "$randgreeting" = "on" ]; then
    msg=${greetings[$(($RANDOM % $(echo ${#greetings[@]})))]}
  fi

  # Print the welcome message
  echo -en "$msg, ${USRC}${BOLD}$usr${NCOL}. "
}

#=========Time=========#
clock () {
  # Set the current hour and minute
  if [ "$twelvehour" = "on" ]; then
    if [ $(date +%_I) -lt 10 ]; then
      hour="\b$(date +%_I)"
    else
      hour="$(date +%_I)"
    fi
    ampm=$(date +%p)
  else
    hour=$(date +%H)
    bksp="\b \b"
  fi
  minute=$(date +%M)

  # Print the time
  echo -en "The time is ${TIME}$hour${BLNK}:${NCOL}${TIME}$minute $bksp${ampm}${NCOL}. "
}

#=======Greeting=======#
greeting () {
  # Set the hour
  hour=$(date +%H)
  greet="It's"

  if [ "$goodgreeting" = "on" ]; then
    greet="Good"
  fi

  if [ $hour -le 11 ] && [ $hour -gt 6 ]; then
    echo -en "$greet ${MORN}morning 󰖜 ${NCOL}. "
  elif [ $hour -eq 12 ]; then
    echo -en "It's ${AFTN}noon 󰖕 ${NCOL}. "
  elif [ $hour -le 17 ] && [ $hour -gt 12 ]; then
    echo -en "$greet ${AFTN}afternoon 󰖛 ${NCOL}. "
  elif [ $hour -le 19 ] && [ $hour -gt 17 ]; then
    echo -en "$greet ${EVEN}evening 󰖔 ${NCOL}. "
  else
    echo -en "It's ${NIGH}night 󰖔 ${NCOL}. "
  fi
}

#=====Battery Info=====#
battery () {
  # Set battery level
  # Set a default to prevent errors
  batlvl=0

  if [[ -a "/sys/class/power_supply/BAT0/capacity" ]]; then
    batlvl=$(cat /sys/class/power_supply/BAT0/capacity)
  elif [[ -a "/sys/class/power_supply/BAT1/capacity" ]]; then
    batlvl=$(cat /sys/class/power_supply/BAT1/capacity)
  else
    batlvl=-1
  fi

  # Change color depending on level
  if [ $batlvl -ge 100 ]; then
    echo -en "The battery is ${FULL}fully chargeda 󰂅 ${NCOL}. "
  elif [ $batlvl -gt 0 ]; then
    echo -en "The battery level is "
    if [ $batlvl -le 15 ]; then
      echo -en "${CRIT}$batlvl%${NCOL}. "
      if [ "$rechargenotif" = "on" ]; then
        echo -en "- ${NORM}You should probably recharge${NCOL}. "
      fi
    elif [ $batlvl -le 30 ]; then
      echo -en "${LOW}$batlvl%${NCOL}. "
    else
      echo -en "${NORM}$batlvl%${NCOL}. "
    fi
  fi
}

#=========COLORS=======#
NCOL='\e[0m'
BOLD='\e[1m'
ITAL='\e[3m'
UNDR='\e[4m'
BLNK='\e[5m'

# Battery level colors
CRIT='\e[31m'
LOW='\e[33m'
NORM='\e[32m'
FULL='\e[3;4;92m'

TIME='\e[38;2;224;146;252;1m' # Clock color
DATE='\e[38;2;50;168;82;1m'
USRC='\e[38;2;50;168;82;1m' # <-----------Username color

# Greeting colors
NIGH='\e[38;2;200;107;209m'
MORN='\e[38;2;255;164;74m'
AFTN='\e[38;2;250;245;110m'
EVEN='\e[38;2;171;54;3m'

#==================SETUP=================#
# Select which parts you want active by  #
# commenting them out. For example, on a #
# desktop, disabling the battery message #
# is a good idea. You can also re-order  #
# them to change how they display!       #
#========================================#

greetings=("Welcome" "Greetings" "Hello" "Hi") # Add your own greetings!
randgreeting="on"  #< Turn the random greetings on (eg. "Hello <user>, Hi <user>")
twelvehour="on"     #< Switch between 12 and 24 hour time (eg. 8:00 PM vs 20:00)
rechargenotif="off" #< Notify that you should recharge if below 15%
flatpakupd="off"    #< Check for flatpak updates, this slows startup down A LOT
goodgreeting="on"   #< Display greetings like "Good afternoon," else "It's afternoon"

welcome
greeting
clock
battery
echo # Properly line break at the end
