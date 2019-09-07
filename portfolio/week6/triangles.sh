#!/bin/bash

baseTriangle()
{
    b=1
    h=1
    while (( 1 < $b || 100 > $h )); do
    area=$(($b*$h/2))
    echo "The area for triangle with base: $b and height: $h is: $area"
    b=$((b+1))
    h=$((h+1))
    done
}

baseTriangle