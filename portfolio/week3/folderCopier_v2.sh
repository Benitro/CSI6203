#!/bin/bash

#Author: Ben Walker
#Edith Cowan University

folderName=""
# FUNCTION
IsFolderNameValid() {
    #if the name is a valid directory
    if [ -d "$folderName" ]; then
        #copy it to a new location
        read -p "Type the name of the destination folder: " newFolderName
        cp -r "$folderName" "$newFolderName"
    else 
        #otherwise, print an error
        echo "[Folder is invalid] Unable to copy and move folder: " "$folderName"
        exit 1
    fi
}

CopyNewFolderName() {
    read -p "Type the name of the folder you would like to copy: " folderName
}

#EBD
IsFolderNameValid
CopyNewFolderName
tree

echo "Done!"
exit 0