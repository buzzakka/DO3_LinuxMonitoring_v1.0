#!/bin/bash

# Library
. ./library.sh

# Values
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

showParams;
saveParamsInFile;