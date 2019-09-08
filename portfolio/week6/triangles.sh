#!/bin/bash

baseTriangle()
{
    area=$(($1*$2/2))
    echo "The area for triangle with base: $1 and height: $2 is: $area"
}

baseTriangle 1 2