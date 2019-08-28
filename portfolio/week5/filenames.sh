#!/bin/bash

#If the file can be read, then commence the loop
if [ -r "$1" ]; then
#While the file is being read, check to see if the file or directory exist
    while read line; do
        if [ -d $line ]; then
            echo "$line - That's a directory"
        elif [ -f $line ]; then
            echo "$line - That file exists"
        #Else, the file doesn't exist
        else
            echo "$line - I don't know what that is!"
        #Done, close file
        fi; done < "$1"
#Else file can't be read
else
    echo "I cannot read the file!"
fi 
exit 0