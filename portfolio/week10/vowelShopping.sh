#!/bin/bash

echo "Your shopping list is as follows:"

awk 'BEGIN {
    FS=","
    }
    /^[aeiou]/ { 
        print "starts with a vowel: " $1
        }' ../week9/shopping.csv