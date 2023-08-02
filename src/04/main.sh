#!/bin/bash

# Library
. ./library.sh

config_file="colors.config";
if test -e "$config_file"; then
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
    column1_background=$( normalizeColorValue $(cat $config_file | grep column1_background | awk 'BEGIN{FS="="} {print $2}'));
    column1_font_color=$( normalizeColorValue $(cat $config_file | grep column1_font_color | awk 'BEGIN{FS="="} {print $2}'));
    column2_background=$( normalizeColorValue $(cat $config_file | grep column2_background | awk 'BEGIN{FS="="} {print $2}'));
    column2_font_color=$( normalizeColorValue $(cat $config_file | grep column2_font_color | awk 'BEGIN{FS="="} {print $2}'));

    col1_bg_code=$( getColor $column1_background 1);
    col1_fc_code=$( getColor $column1_font_color 2);
    col2_bg_code=$( getColor $column2_background 1);
    col2_fc_code=$( getColor $column2_font_color 2);
    color_end_code="\033[0m\033[0m";
    
    if [[ col1_bg_code -ne col1_fc_code ]] && [[ col2_bg_code -ne col2_fc_code ]]; then
        col1_bg_code="\033[4${col1_bg_code}m";
        col1_fc_code="\033[3${col1_fc_code}m";
        col2_bg_code="\033[4${col2_bg_code}m";
        col2_fc_code="\033[3${col2_fc_code}m";

        showParams;
        printColors;
    else
        echo "Error: background color and font color are the same. Please, change values in $config_file.";
    fi;
else
    echo "Error: colors.config does not exist.";
fi;