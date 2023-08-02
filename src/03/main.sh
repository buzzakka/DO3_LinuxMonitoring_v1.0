#!/bin/bash

# Library
. ./library.sh

if [[ $# -eq 4 ]]; then
if [[ $1 -ne $2 ]] && [[ $3 -ne $4 ]]; then
if [[ $(checkParams $1 $2 $3 $4) -eq 1 ]]; then

    # System info values
    hostname=$HOSTNAME;
    timezone="$(cat /etc/timezone) $(date +"%Z %z")";
    user=$USER;
    os=$(uname -rs);
    date=$(date +"%d %b %m %Y %H:%M:%S");
    uptime=$(uptime -p);
    uptime_sec=$(awk '{print $1}' /proc/uptime);
    ip=$(hostname -I | awk '{print $1}');
    mask=$(ifconfig | grep $ip | awk '{print $4}');
    gateway=$(ip route | grep default | awk '{printf $3}');
    ram_total=$(free | grep Mem: | awk '{printf("%.3f GB", $2/1024/1024)}');
    ram_used=$(free | grep Mem: | awk '{printf("%.3f GB", $3/1024/1024)}');
    ram_free=$(free | grep Mem: | awk '{printf("%.3f GB", $4/1024/1024)}');
    space_root=$(df | grep /$ | awk '{printf("%.2f MB", $2/1024)}');
    space_root_used=$(df | grep /$ | awk '{printf("%.2f MB", $3/1024)}');
    space_root_free=$(df | grep /$ | awk '{printf("%.2f MB", $4/1024)}');

    # Color values
    col1_bg_code="\033[4$( getColor $1)m";
    col1_fc_code="\033[3$( getColor $2)m";
    col2_bg_code="\033[4$( getColor $3)m";
    col2_fc_code="\033[3$( getColor $4)m";
    color_end_code="\033[0m\033[0m";

    showParams;
else
    echo "Error: incorrect input values. Input values must be in range [1-6].";
fi;
else
    echo "Error: background color and font color are the same. Please, restart the script.";
fi;
else
    echo "Error: incorrect number of arguments";
fi;