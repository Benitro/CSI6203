#!/bin/bash

webTitle=$(~/CSI6203/portfolio/week6/internetDownloadFunc.sh)

printTitle=$(echo -e "$printTitle" | sed -n 's/<title.*>\(.*\)<\/title>.*/\1/p' index.html)

echo -e "Downloaded a page with the title:" "$printTitle"