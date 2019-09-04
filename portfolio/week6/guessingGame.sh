#!/bin/bash

getNumber()
{
    read -p "$1: "
    while true; do
        if [ $REPLY -lt $2 ]; then
            echo "Too low!"
            read -p "$1: "
        elif [ $REPLY -gt $2 ]; then
            echo "Too high!"
            read -p "$1: "
        else
            echo "Correct!"
            break
        fi
    done
}

getNumber "please type a number between 1 and 100" 42