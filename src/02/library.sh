#!/bin/bash
# Library with support functions

# Show info about this system
function showParams {
    echo "HOSTNAME = $hostname";
    echo "TIMEZONE = $timezone";
    echo "USER = $user";
    echo "OS = $os";
    echo "DATE = $date";
    echo "UPTIME = $uptime";
    echo "UPTIME_SEC = $uptime_sec";
    echo "IP = $ip";
    echo "MASK = $mask";
    echo "GATEWAY = $gateway";
    echo "RAM_TOTAL = $ram_total";
    echo "RAM_USED = $ram_used";
    echo "RAM_FREE = $ram_free";
    echo "SPACE_ROOT = $space_root";
    echo "SPACE_ROOT_USED = $space_root_used";
    echo "SPACE_ROOT_FREE = $space_root_free";
}

# Save info about this system in file named DD_MM_YY_HH_MM_SS.status
function saveParamsInFile {
    echo "Save in file? [Y/N]";
    read save_choice;
    if [[ $save_choice = Y ]] || [[ $save_choice = y ]]; then
        filename=$(date +"%d-%m-%y-%H-%M-%S")".status";
        touch "$filename";
        
        echo "HOSTNAME = $hostname" >> $filename;
        echo "TIMEZONE = $timezone" >> $filename;
        echo "USER = $user" >> $filename;
        echo "OS = $os" >> $filename;
        echo "DATE = $date" >> $filename;
        echo "UPTIME = $uptime" >> $filename;
        echo "UPTIME_SEC = $uptime_sec" >> $filename;
        echo "IP = $ip" >> $filename;
        echo "MASK = $mask" >> $filename;
        echo "GATEWAY = $gateway" >> $filename;
        echo "RAM_TOTAL = $ram_total" >> $filename;
        echo "RAM_USED = $ram_used" >> $filename;
        echo "RAM_FREE = $ram_free" >> $filename;
        echo "SPACE_ROOT = $space_root" >> $filename;
        echo "SPACE_ROOT_USED = $space_root_used" >> $filename;
        echo "SPACE_ROOT_FREE = $space_root_free" >> $filename;

        echo "File $filename created";
    fi;
}