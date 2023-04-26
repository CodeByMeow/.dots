#!/bin/bash
# Author: https://github.com/AlphaTechnolog
# Adapted by: https://github.com/Fxzzi
user="${USER}"
shell="$(basename ${SHELL})"
distro=$(. /etc/os-release ; echo "$ID")
wm="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"
kernel="$(uname -r | cut -d '-' -f1)"
packages="$(pacman -Q | wc -l)"

white='\033[37m'
cyan='\033[36m'
blue='\033[34m'
green='\033[32m'
purple='\033[35m'
bold='\033[1m'
red='\033[91m'
end='\033[0m'
yellow='\033[93m'

len () {
  echo $@ | wc -c
}

repeat_by_len () {
  local str=$1
  local char=$2
  local len=$(len $str)
  local i=1

  while [[ $i -lt $len ]]; do
    printf "$char"
    i=$(expr $i + 1)
  done
}

printf '%b' "
${bold}${blue} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣶⣄⣀⡀              ${end}${bold}${blue}${user}${cyan}@${purple}$(cat /etc/hostname)${end}
${bold}${blue}⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⡀⣠⣾⡇⠀⠀⠀ ⠀${end}${green}$(repeat_by_len "${user}@$(cat /etc/hostname)" "─")
${bold}${blue}⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀ ⠀${end}${bold}${purple}⛰️  ${blue}os${green}  ${magenta} ${cyan}${distro}${end}
${bold}${blue}⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⡇     ${end}${bold}${yellow}🗻 ${blue}sh${green}  ${magenta} ${cyan}${shell}${end}
${bold}${blue}⣶⣿⣦⣜⣿⣿⣿⡟⠻⣿⣿⣿⣿⣿⣿⣿⡿⢿⡏⣴⣺⣦⣙⣿⣷⣄⠀⠀  ${end}${bold}${green}🚵 ${blue}wm${green}  ${magenta} ${cyan}${wm}${end}
${bold}${blue}⣯⡇⣻⣿⣿⣿⣿⣷⣾⣿⣬⣥⣭⣽⣿⣿⣧⣼⡇⣯⣇⣹⣿⣿⣿⣿⣧⠀⠀ ${end}${bold}${red}🏔️ ${blue}kr${green}  ${magenta} ${cyan}${kernel}${end}
${bold}${blue}⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣷  ${end}${bold}${white}🌄 ${blue}pk${green}  ${magenta} ${cyan}${packages}${end}
"
