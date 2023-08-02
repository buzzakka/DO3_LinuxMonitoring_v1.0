#!/bin/bash
# Library with support functions

# Make color default when there is no color or color not in range [1-6]
# $1 - input color value
function normalizeColorValue {
    case $1 in
        [1-6]) echo $1;;
        *) echo "default";;
    esac;
}

# Convert input color value to the true color value
# $1 - input color value;
# $2 - flag (background or font)
function getColor {
    case $1 in
        1) echo 7;;
        2) echo 1;;
        3) echo 2;;
        4) echo 4;;
        5) echo 5;;
        6) echo 0;;
        *) if [[ $2 -eq 1 ]]; then
            echo 0;
        else
            echo 7;
        fi;
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

# Print color name
# $1 - input color value
# $2 - flag (background or font)
function printColor {
    case $1 in
        1) echo "(white)";;
        2) echo "(red)";;
        3) echo "(green)";;
        4) echo "(blue)";;
        5) echo "(purple)";;
        6) echo "(black)";;
        "default") if [[ $2 -eq 1 ]]; then
            echo "(black)";
        else
            echo "(white)";
        fi
    esac
}

# Print color names
function printColors {
    echo -en '\n';
    echo "Column 1 background = $column1_background $(printColor $column1_background 1)";
    echo "Column 1 font color = $column1_font_color $(printColor $column1_font_color 2)";
    echo "Column 2 background = $column2_background $(printColor $column2_background 1)";
    echo "Column 2 font color = $column2_font_color $(printColor $column2_font_color 2)";
}