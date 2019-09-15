#!/bin/bash

ipInfo="$(./ipInfo.sh)"

formatIpAddr=$(echo "$ipInfo" |sed -n '/IP Address: / {
s/IP Address/IP Address/
p
}')

echo -e "$formatIpAddr"