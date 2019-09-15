#!/bin/bash

#Print message "Editing file..."
echo "Editing file..."

#Using sed to find the word 'Linux', and above the line, insert the text
sed -i '/Linux/ i The next line contains the word Linux!' $1

#Print "Done!"
echo "Done!"