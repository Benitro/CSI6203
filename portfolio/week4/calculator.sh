#!/bin/bash

blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'
clearColour='\033[0m'
#if the user inputs one of the operators, depending on the operator, the arithmetic will called to perform the calculation.
#depending on the outcome, the output will be displayed in a different colour
if [ $2 = "+" ]; then
    echo -e "${blue}$(( $1 + $3 ))${clearColour}"
elif [ $2 = '-' ]; then
    echo -e "${green}$(( $1 - $3 ))${clearColour}"
elif [ $2 = 'x' ]; then
    echo -e "${red}$(( $1 * $3 ))${clearColour}"
elif [ $2 = '/' ]; then
    echo -e "${purple}$(( $1 / $3 ))${clearColour}"
fi
exit 0