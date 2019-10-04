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

function downloadImage() {
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
        fi
    fi
}

function explanationViewer() {
    htmlContent=$(storeContent $@)
    if [[ $htmlContent = "notFound" ]]; then
        echo -e "\nUnable to connect to nasa.gov."
        exit 1
    else
        explain=$(grabExplanation $htmlContent | sed 's/\<Explanation\>://g')
        if [[ -z $explain ]]; then
            echo -e "\nNo content to display today. Try again tomorrow.."
            exit 1
        else
            echo -e "\n$explain"
        fi
    fi
}

function detailViewer() {
    htmlContent=$(storeContent $@)
    if [[ $htmlContent = "notFound" ]]; then
        echo -e "\nUnable to connect to nasa.gov."
        exit 1
    else
        title=$(grabImageNameTitle $htmlContent)
        echo -e "\nTITLE: $title"
        explain=$(grabExplanation $htmlContent | sed 's/Explanation/EXPLANATION/')
        echo -e "\n$explain"
        credit=$(grabImageCredit $htmlContent | sed 's/Image Credit/IMAGE CREDIT/')
        if [[ -z $credit ]]; then
            echo -e "\nNo image available today. Please try again later.."
            exit 1
        else
            echo -e "\n$credit"
        fi
    fi
}

function downloadImageRange() {
    i=1
    startDate=$(date -d $1 +%y%m%d)
    endDate=$(date -d $2 +%y%m%d)
    rangeDate=$startDate
    while [ "$rangeDate" -le "$endDate" ]; do
        callDownloadImg=$(downloadImage "$rangeDate")
        echo "$callDownloadImg"
        rangeDate=$(date +%y%m%d -d "$rangeDate + i day")
        i=i++;
    done
}

#downloadImage $2
#explanationViewer $2
#detailViewer $2
#downloadImageRange $1 $2