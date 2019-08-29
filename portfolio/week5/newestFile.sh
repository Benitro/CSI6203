#!/bin/bash
#If the number of files in the command line argument != '3', then print error message, and exit
if [ "$#" -ne 3 ]; then
    echo "Error! Number of files passed does not equal to '3'!"
    exit 1
#Else, list and store the file names into a variable for files in the directory, and files listed in the command line argument
else
    folderVar=$(ls)
    fileVar=$(ls $*)
    #If file names do not match between the two list, then print the file name that doesn't exist, then print the file name in FileVar that's the newest
    if comm -13 <(ls -f $folderVar) <(ls -f $fileVar); then
        ls -t $fileVar | head -n1
    #Else, print 'Files not found!', and exit
    else
        echo "Files not found!"
        exit 1
    fi
fi