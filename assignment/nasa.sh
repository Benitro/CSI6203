#!/bin/bash

# Author: Benjamin Jacob Walker
# Edith Cowan University

# storeContent function is used to extract the HTML elements from the webpage. 
#   This takes a formatted date input

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

# grabImageNameTitle function is used to extract the title of the page from within the HTML elements

function grabImageNameTitle() {
    local imageName=$(echo $@ | grep -o "<b>.*</b> <br>" | sed 's/<[^>]*>//g')
    echo $imageName
}

# grabExplanation function is used to extract the explanation taken from the webpage

function grabExplanation() {
    local explain=$(echo $@ | grep -o "<b> Explanation.*<p>.*<center>" | sed 's/<[^>]*>//g')
    echo $explain
}

# grabImageCredit function is used to extract the Image Credit detail from the webpage

function grabImageCredit() {
    local credit=$(echo $@ | grep -o "Image Credit.*</center> <p>" | sed 's/<[^>]*>//g')
    echo $credit
}

# grabImageWebLink function is used to extract the image extension, and append to the end of the webpage URL

function grabImageWebLink() {
    local extension=$(echo $@ | grep -o 'image/.*<I' | sed 's/<I/>/g' | tr -d '>"')
    local addExtension="https://apod.nasa.gov/apod/"$extension
    if [ -z $extension ]; then
        echo "noImageFound"
    else
        echo $addExtension
    fi
}

# downloadImage function is used to download the image to the source directory. 
#   If the webpage is unavailable, an error message will appear. 
#   If an image is not found (content may be video), an error message will appear

function downloadImage() {
    htmlContent=$(storeContent $@)
    if [[ $htmlContent = "notFound" ]]; then
        echo -e "\nUnable to connect to nasa.gov."
        exit 1
    else
        imageLink=$(grabImageWebLink $htmlContent)
        if [[ $imageLink = "noImageFound" ]]; then
            echo -e "\nNo image was found for this date."
            exit 1
        else
            imageName=$(grabImageNameTitle $htmlContent)
            imageType=$(grabImageWebLink $htmlContent | sed 's/.*\.//')
            echo -e "\nDownloading "\"${imageName}"."${imageType}\"
            wget -q $imageLink
        fi
    fi
}

# explanationViewer function is used to display the explanation or detail of the webpage.
#   If the explanation is not found, an error message will appear

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

# detailViewer function is used to display the detail of the webpage (Title, Explanation, and Image Credit).
#   If an image is not found (i.e. video content), an error message will appear

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

# downloadImageRange function is used to download a set of images with a specific date range.
#   If the number of days is > 10 days, an error message will appear.
#   If the number of days is < 10 days, the function will proceed in downloading images to the source

function downloadImageRange() {
    i=1
    startDate=$(date -d $1 +%y%m%d)
    endDate=$(date -d $2 +%y%m%d)
    between=$(($endDate-$startDate))
    if [[ $between -le 10 ]]; then
        rangeDate=$startDate
        while [ "$rangeDate" -le "$endDate" ]; do
            callDownloadImg=$(downloadImage "$rangeDate")
            echo "$callDownloadImg"
            rangeDate=$(date +%y%m%d -d "$rangeDate + i day")
            i=i++;
        done
    else 
        echo -e "\nMaximum number of images to download is 10. Please try again."
    fi
}

# Using a case statement, and taking the 1st command line argument, it will look for the 1st argument
#   and call to that particular function

## Example of the commands for each of the inputs ##

# downloadImage; i.e. ./nasa.sh -d 2019-01-01
# explanationViewer; i.e. ./nasa.sh --type explanation --date 2019-01-01 
# detailViewer; i.e. ./nasa.sh -t details -d 2019-01-01
# downloadImageRange; i.e. ./nasa.sh --range 2019-01-01 2019-01-04

case $1 in
    "-d")
        echo -e "Connecting to nasa.gov..."
        downloadImage $2
        echo -e "\nFinished.";;
    "--type")
        echo -e "Connecting to nasa.gov..."
        explanationViewer $4
        echo -e "\nFinished.";;
    "-t")
        echo -e "Connecting to nasa.gov..."
        detailViewer $4
        echo -e "\nFinished.";;
    "--range")
        echo -e "Connecting to nasa.gov..."
        downloadImageRange $2 $3
        echo -e "\nFinished.";;
    *)
        echo -e "\nUnknown input.";;
esac
exit 0