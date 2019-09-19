#!/bin/bash

#Execute the InternetDownloadFunc
webTitle=$(~/CSI6203/portfolio/week6/internetDownloadFunc.sh)

#Using sed to parse the value from <title>
printTitle=$(sed -n -e 's!.*<title>\(.*\)</title>.*!\1!p' index.html)

#Print the title to output
echo -e "Downloaded a page with the title:" "$printTitle"