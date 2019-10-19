#!/bin/bash

#Print Auth Log: followed by the positions in the auth.log file; <date>, <time>, source:, message:

echo -e "Auth Log:"
awk '/^/ {print $1 " " $2 " - " $3 ":"}
{print $5}
{message=" "; for(i=6;i<=NF;i++){message=message" "$i}; printf("\t%-15s\n\n", message)}' /var/log/auth.log