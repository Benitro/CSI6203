#!/bin/bash

#Author: Benjamin Jacob Walker
#Edith Cowan University

function storeContent() {
    local formatDate=$(date -d $@ +%y%m%d)
    local url="https://apod.nasa.gov/apod/ap"$(echo "$formatDate")".html"
    local content=$(curl -s $url)
    if [[ $? -eq 0 ]]; then
        echo "$content"
    else
        echo "notFound"
    fi
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
    if [ -z $extension ]; then
        echo "noImageFound"
    else
        echo $addExtension
    fi
}

function imageDownloader() {
    echo "Connecting to nasa.gov..."
    htmlContent=$(storeContent $@)
    if [[ $htmlContent = "notFound" ]]; then
        echo -e "\nUnable to connect to nasa.gov."
        exit 1
    else
        imageLink=$(grabImageWebLink $htmlContent)
        if [[ $imageLink = "noImageFound" ]]; then
            echo -e "\nNo image was found for this date. Closing connection.."
            exit 1
        else
            imageName=$(grabImageNameTitle $htmlContent)
            imageType=$(grabImageWebLink $htmlContent | sed 's/.*\.//')
            echo -e "\nDownloading "\"${imageName}"."${imageType}\"
            wget -q $imageLink
            echo -e "\nFinished."
        fi
    fi
}

imageDownloader $2