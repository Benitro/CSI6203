#!/bin/bash
#Redirect the txt file into the script, to copy an existing directory to a new directory
dir=1; while IFS= read -r "line$dir"; do 
    dir=$((dir + 1))
done
#If the directory exist;
if [ -d "$line1" ]; then
    #Copy the folder, and rename
    cp -r "$line1" "$line2"
else
    #Otherwise, print an error
    echo "I couldn't find that folder"
fi
exit 0