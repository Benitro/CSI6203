#!/bin/bash

#Excute the ipInfo script, and store the response into the variable
ipInfo="$(./ipInfo.sh)"

#To display only the IP Address from the response 
formatIpAddr=$(echo "$ipInfo" |sed -n '/IP Address: / {
s/IP Address/IP Address/
p
}')

#Print the formatIpAddr variable
echo -e "$formatIpAddr"