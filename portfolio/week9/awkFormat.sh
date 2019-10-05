#!/bin/bash

#echo "The items on your shopping list is as follows:" 
#awk '{
#    print $1 
#}' shopping.csv

echo "Your shopping list is as follows:"
awk 'BEGIN {
    FS=","
    }
    { 
        print $1 
    }' shopping.csv