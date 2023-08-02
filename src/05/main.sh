#!/bin/bash

#Library
. ./library.sh

start_time=$(date +%s);

if [[ $# -eq 1 ]]; then
if [[ $1 =~ /$ ]]; then
if [[ -e $1 ]]; then
    file_name=$(makeNormalFileName $1);
    printInfo;
    end_time=$(date +%s);
    echo "Script execution time (in seconds) = $(( $end_time - $start_time ))";
else echo "Error: directory doesn't exist.";
fi
else echo "Error: argument should end with '/'.";
fi
else echo "Error: need one argument in input.";
fi