#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Error! Number of files passed does not equal to '3'!"
    exit 1
else
    if test -e "$*"; then
        echo "Files found!"
        echo "$?"
    else
        echo "Files not found!"
    fi
fi