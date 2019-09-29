#!/bin/bash

#Store the curl output into a variable
webOutput=$(curl -s http://example.com)

#Extract the <h1> value from the HTML
header=$(echo "$webOutput" | grep -o "<h1>.*" | sed 's/<[^>]*>//g' | head -1)

#Extract the <p> value, and trim the newline out (to store output to a single line)
paragraph=$(echo "$webOutput" | tr -d '\n' | grep -o "<p>.*" | sed 's/<[^>]*><a.*//g')

#Strip the <p> tags, and expose the value
formatPara=$(echo "$paragraph" | grep -o "<p>.*" | sed 's/<[^>]*>//g' | head -1)

#Print the output
echo -e "$header\n$formatPara"