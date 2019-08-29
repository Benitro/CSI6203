#!/bin/bash
for ip in 'seq 1 254'
do
ping -c1 -w1 8.8.8.8
done
if [[ $? -eq 0 ]]; then
    echo "Internet seems to be connected!"
else
    echo "Internet is down!"
fi
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