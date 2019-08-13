#!/bin/bash
#If the txt file can be read, then prompt message 'I can read the file!'
if [ -r secret.txt ]; then
    echo "I can read the file!"
#If the txt file cannot be read, then prompt message 'I cannot read the file!'
else
    echo "I cannot read the file!"
#End
fi 
exit 0