#!/bin/bash

#Fuction to download the webpage, and store into the choosen directory. The output of the wget response is limited using -nv
internetDownload()
{
    wget -nv http://$saveUrl -P $dir
}

#Print the message
echo "Running the download function:"
#Prompt the user to specify the webpage they would like to download
read -p "Type the URL of a file to download: " saveUrl
#Prompt the user to specify the folder location they would like to save it to
read -p "Type the location of where you would like to download the file: " locFile
#Call the function, passing the input from the user
#dir=$(find / -type d -name "$locFile")
dir=$(locate -b "$locFile")
internetDownload
#Print the message below, and exit
echo "Download function complete!"
exit 0