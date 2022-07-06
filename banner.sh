#!/bin/bash
if [ "$PS1" ]; then
#Bash Colour Codes
green="\033[00;32m"
txtrst="\033[00;0m"

if [ -f /etc/redhat-release ]; then
        linux_ver=`cat /etc/redhat-release`
elif [ -f /etc/debian_version ]; then
        linux_ver="Debian "`cat /etc/debian_version`
else
        linux_ver=""
fi

echo -e "

  _____  _       ____   _    _  _____    _____   ____   ______  _______    ____    _____ __   __
 / ____|| |     / __ \ | |  | ||  __ \  / ____| / __ \ |  ____||__   __|  |___ \  / ____|\ \ / /
| |     | |    | |  | || |  | || |  | || (___  | |  | || |__      | |       __) || |      \ V /
| |     | |    | |  | || |  | || |  | | \___ \ | |  | ||  __|     | |      |__ < | |       > <
| |____ | |____| |__| || |__| || |__| | ____) || |__| || |        | |      ___) || |____  / . \ 
 \_____||______|\____/  \____/ |_____/ |_____/  \____/ |_|        |_|     |____/  \_____|/_/ \_\ 


 Linux Version  : ${linux_ver}
 Welcome to     : "3CX Phone System by Cloudsoft"
 Uptime         : `uptime | grep -ohe 'up .*' | sed 's/up //g' | awk -F "," '{print $1}'`
 Load           : `uptime | grep -ohe 'load average[s:][: ].*' | awk '{ print "Last Minute: " $3" Last 5 Minutes: "$4" Last 15 Minutes: "$5 }'`
 Users          : `uptime | grep -ohe '[0-9.*] user[s,]'`
 IP Address     : ${green}`ip addr | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | xargs`${txtrst}
 Clock          :`timedatectl | sed -n '/Local time/ s/^[ \t]*Local time:\(.*$\)/\1/p'`
 NTP Sync.      :`timedatectl |awk -F: '/NTP sync/ {print $2}'`
"
fi