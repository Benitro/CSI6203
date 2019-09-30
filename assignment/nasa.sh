#!/bin/bash

#Author: Benjamin Jacob Walker
#Edith Cowan University

function storeContent() {
    local formatDate=$(date -d $2 +%y%m%d)
    local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    local content=$(curl -s $url)
    echo "$content"
}

function grabImageNameTitle() {
    local imageName=$(echo $@ | grep -o "<b>.*</b> <br>" | sed 's/<[^>]*>//g')
    echo $imageName
}

function grabExplanation() {
    local explain=$(echo $@ | grep -o "<b> Explanation.*<p>.*<center>" | sed 's/<[^>]*>//g')
    echo $explain
}

function grabImageCredit() {
    local credit=$(echo $@ | grep -o "Image Credit.*</center> <p>" | sed 's/<[^>]*>//g')
    echo $credit
}

function grabImageWebLink() {
    local extension=$(echo $@ | grep -o 'image/.*<I' | sed 's/<I/>/g' | tr -d '>"')
    local addExtension="https://apod.nasa.gov/apod/"$extension
    echo $addExtension
}

#Notes: Testing video content ..apod/ap190108