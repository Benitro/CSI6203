#!/bin/bash

#For each ping in range, print the response
for ip in 'seq 1 254'
do
ping -c1 -w1 8.8.8.8
done
#If the response = 0, then the Internet is connected!
if [[ $? -eq 0 ]]; then
    echo "Internet seems to be connected!"
#If not, then the Internet is down!
else
    echo "Internet is down!"
fi
#Prompt the user to input a website URL, and download the index.html page. Once the user inputs 'exit', close the loop/program
while :
    do
    read -p "Please type a website URL to download or type 'exit' to quit: " websiteURL
    if [ $websiteURL = 'exit' ]; then
        break
        exit 0
    else
        wget http://$websiteURL
    fi
done