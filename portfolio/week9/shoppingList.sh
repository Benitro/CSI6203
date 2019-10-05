#!/bin/bash

echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$"; print "Item | Quantity | Price"}
{printf("%-15s | %-10s| %-10s\n", $1, $2, $3)}' shopping.csv