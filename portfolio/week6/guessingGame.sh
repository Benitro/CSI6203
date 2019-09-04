#!/bin/bash

#Once the user inputs a number, it will call the function getNumber
getNumber()
{
    read -p "$1: "
    while true; do
        #If the number is less than the input, print a message
        if [ $REPLY -lt $2 ]; then
            echo "Too low!"
            read -p "$1: "
        #If the number is greater than the input, print a message
        elif [ $REPLY -gt $2 ]; then
            echo "Too high!"
            read -p "$1: "
        #Else, the input is correct
        else
            echo "Correct!"
            break
        #End
        fi
    done
}

getNumber "please type a number between 1 and 100" 42