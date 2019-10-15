#!/bin/bash

echo "Your shopping list is as follows:"

awk 'BEGIN {
    FS=","
    }
    /^[aeiou]/ { 
        print "starts with a vowel: " $1
        }
    /^o/ {
        print "starts with an o: " $1
        }
    /[a-z][[:blank:]][a-z]*/ {
        print "has more than one word: " $1
        }
    /.*,.*,[0-9]+$/ {
        print "whole number price: " $1
        }' ../week9/shopping.csv