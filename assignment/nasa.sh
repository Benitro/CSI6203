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
    local imageName=$(echo $@ | grep -o "<b>.*</b> <br>" | sed 's/<[^>]*>//g' | head -1)
    echo $imageName
}

function grabExplanation() {
    local explain=$(echo $@ | grep -o "<b> Explanation.*<p>.*</a> <br> <b>" | sed 's/<[^>]*>//g')
    echo $explain
}

function grabImageCredit() {
    local credit=$(echo $@ | grep -o "<b> Image Credit.* </center> <p>" | sed 's/<[^>]*>//g' | head -1)
    echo $credit
}

#storeContent $1 $2
#grabImageName $1 $2
#grabExplanation $1 $2
#grabImageCredit $1 $2