#!/bin/bash

internetDownload()
{
    wget http://$saveUrl -P ~/$locFile
}

echo "Running the download function:"
read -p "Type the URL of a file to download: " saveUrl
read -p "Type the location of where you would like to download the file: " locFile
internetDownload
echo "Download function complete!"