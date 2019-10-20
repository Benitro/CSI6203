#!/bin/bash

#First, call the HTML elements, then pipe out the HTML tags required, and once all the relevant values are output, remove duplicate values

curl -s https://www.ecu.edu.au/degrees/study-areas/science | awk '/title=/{print $i}' | grep -o '<a href.*' | grep -o '/science/.*' | sed 's/.*">//' | sed 's/<[^>]*>//g' | awk '!seen[$1]++'