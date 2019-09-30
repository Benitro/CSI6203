#!/bin/bash

function storeContent() {
    local formatDate=$(date "$1" $2 +%y%m%d)
    local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    local content=$(curl -s $url)
    echo "$content"
}

function grabImageNameTitle() {
    #local formatDate=$(date "$1" $2 +%y%m%d)
    #local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    #local content=$(curl -s $url)
    local imageName=$(echo $@ | grep -o "<b>.*</b> <br>" | sed 's/<[^>]*>//g')
    echo $imageName
}

function grabExplanation() {
    #local formatDate=$(date "$1" $2 +%y%m%d)
    #local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    #local content=$(curl -s $url)
    local explain=$(echo $@ | grep -o "Explanation.*<p>.*<center>" | sed 's/<[^>]*>//g')
    echo $explain
}

function grabImageCredit() {
    #local formatDate=$(date "$1" $2 +%y%m%d)
    #local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    #local content=$(curl -s $url)
    local credit=$(echo $@ | grep -o "Image Credit.*</center> <p>" | sed 's/<[^>]*>//g')
    echo $credit
}

function grabImageWebLink() {
    #local formatDate=$(date "$1" $2 +%y%m%d)
    #local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    #local content=$(curl -s $url)
    local extension=$(echo $@ | grep -o 'image/.*<I' | sed 's/<I/>/g' | tr -d '>"')
    local addExtension="https://apod.nasa.gov/apod/"$extension
    echo $addExtension
}

storeContent $1 $2
#grabImageNameTitle $1 $2
#grabExplanation $1 $2
#grabImageCredit $1 $2
#grabImageWebLink $1 $2

#Notes: Testing video content ..apod/ap190108