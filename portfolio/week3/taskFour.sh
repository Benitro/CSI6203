#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Error! Number of files passed does not equal to '3'!"
    exit 1
else
    folderVar=$(ls)
    fileVar=$(ls $*)
    if comm -13 <(ls -f $folderVar) <(ls -f $fileVar); then
        ls -t $fileVar | head -n1
    else
        echo "Files not found!"
        exit 1
    fi
fi