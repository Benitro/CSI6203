#!/bin/bash

echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$"; print "Item            | Quantity  | Price"; print "                |           |      "; print "-------------------------------------"}
{printf("%-15s | %-10s| %-10s\n", $1, $2, currency $3)}' shopping.csv