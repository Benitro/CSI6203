#!/bin/bash

content=$(curl -s https://www.ecu.edu.au/degrees/study-areas/science)
title=$(echo $content | grep -o '<.*>\|^--.*' | sed 's/<[^>]*>//g')
echo $title