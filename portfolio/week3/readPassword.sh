#!/bin/bash
#If the txt file can be read, then read the txt file line by line, and print the content of the file. At the end of the file, print a completed message
if [ -r secret.txt ]; then
    while read line; 
        do echo $line; done < secret.txt
    echo "File read."
#If the txt file cannot be read, then prompt message 'I cannot read the file!'
else
    echo "I cannot read the file!"
#End
fi 
exit 0