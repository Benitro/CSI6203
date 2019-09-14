#!/bin/bash

#Function for calculating the area of a triangle
baseTriangle()
{
    area=$((b*h/2))
    echo "The area for triangle with base: $b and height: $h is: $area"
}

b=1
h=1

#For literation of 1 - 100, call the triangle function, and if height less than 10, add +1, else add 1+ to base 
for (( i=0; i<100; i++))
do
    baseTriangle
    if [ $h -lt 10 ]; then
        h=$((h+1))
    elif [ $h -le 10 ]; then
        h=$((1))
        b=$((b+1))
    fi
done
exit 0