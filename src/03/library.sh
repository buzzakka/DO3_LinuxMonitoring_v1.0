#!/bin/bash
# Library with support functions

# Check that all input params are in range [1-6]
# $1, $2, $3, $4 - input params
function checkParams {
    if [[ $(checkParam $1) -eq 1 ]] && [[ $(checkParam $2) -eq 1 ]] && [[ $(checkParam $3) -eq 1 ]] && [[ $(checkParam $4) -eq 1 ]]; then
        echo 1;
    else
        echo 0;
    fi;
}

# Check that one input param is in range [1-6]
# $1 - input param
function checkParam {
    if [[ $1 -ge 1 ]] && [[ $1 -le 6 ]]; then
        echo 1;
    else
        echo 0;
    fi;
}

# Convert input color value to the true color value
# $1 - input param
function getColor {
    case $1 in
        1) echo 7;;
        2) echo 1;;
        3) echo 2;;
        4) echo 4;;
        5) echo 5;;
        6) echo 0;;
    esac;
}

# Show info about this system
function showParams {
    echo -e "${col1_bg_code}${col1_fc_code}HOSTNAME${color_end_code} = ${col2_bg_code}${col2_fc_code}$hostname${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}TIMEZONE${color_end_code} = ${col2_bg_code}${col2_fc_code}$timezone${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}USER${color_end_code} = ${col2_bg_code}${col2_fc_code}$user${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}OS${color_end_code} = ${col2_bg_code}${col2_fc_code}$os${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}DATE${color_end_code} = ${col2_bg_code}${col2_fc_code}$date${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}UPTIME${color_end_code} = ${col2_bg_code}${col2_fc_code}$uptime${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}UPTIME_SEC${color_end_code} = ${col2_bg_code}${col2_fc_code}$uptime_sec${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}IP${color_end_code} = ${col2_bg_code}${col2_fc_code}$ip${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}MASK${color_end_code} = ${col2_bg_code}${col2_fc_code}$mask${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}GATEWAY${color_end_code} = ${col2_bg_code}${col2_fc_code}$gateway${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}RAM_TOTAL${color_end_code} = ${col2_bg_code}${col2_fc_code}$ram_total${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}RAM_USED${color_end_code} = ${col2_bg_code}${col2_fc_code}$ram_used${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}RAM_FREE${color_end_code} = ${col2_bg_code}${col2_fc_code}$ram_free${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}SPACE_ROOT${color_end_code} = ${col2_bg_code}${col2_fc_code}$space_root${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}SPACE_ROOT_USED${color_end_code} = ${col2_bg_code}${col2_fc_code}$space_root_used${color_end_code}";
    echo -e "${col1_bg_code}${col1_fc_code}SPACE_ROOT_FREE${color_end_code} = ${col2_bg_code}${col2_fc_code}$space_root_free${color_end_code}";
}