#!/bin/bash

if [[ $# -eq 1 ]]
then
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        echo "Incorrect input: input value is a number";
    else
        echo $1;
    fi
else
    echo "Incorrect input";
fi