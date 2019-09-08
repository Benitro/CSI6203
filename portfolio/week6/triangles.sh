#!/bin/bash

baseTriangle()
{
    area=$(($1*$2/2))
    echo "The area for triangle with base: $1 and height: $2 is: $area"
}
for (( i=0; i<=20; i++))
do
    baseTriangle 1 4
done