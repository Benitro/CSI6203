#!/bin/bash

function storeContent() {
if [[ $? -eq 0 ]]; then
    echo "Connecting to nasa.gov..."
    local formatDate=$(date "$1" $2 +%y%m%d)
    local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    local content=$(curl -s $url)
    echo "$content"
else
    echo "Cannot connect to nasa.gov..."
fi
}

function grabImageName() {
    #local formatDate=$(date "$1" $2 +%y%m%d)
    #local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    #local content=$(curl -s $url)
    local imageName=$(echo $@ | grep -o "<b>.*</b> <br>" | sed 's/<[^>]*>//g' | head -1)
    echo $imageName
    #echo $content
}

function grabExplanation() {
    local formatDate=$(date "$1" $2 +%y%m%d)
    local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    local content=$(curl -s $url)
    local explain=$(echo $content | grep -o "<b> Explanation.*</a>" | sed 's/<[^>]*>//g' | head -1)
    echo $explain
}

#storeContent $1 $2
#grabImageName $1 $2
grabExplanation $1 $2