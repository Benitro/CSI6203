#!/bin/bash

content=$(curl -s https://www.ecu.edu.au/degrees/study-areas/science)
title=$(echo $content | grep -o '<a href="https://www.ecu.edu.au/degrees/study-areas/science/[a-zA-Z][a-zA-Z]*" title="[a-zA-Z][a-zA-Z]*">[a-zA-Z][a-zA-Z]*</a>' | sed 's/<[^>]*>//g')
echo $title