#!/bin/bash

#Print the CSV file into a table, displaying the total for each row, and column

echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$";
print "Item            | Quantity  | Price     | Total"; 
print "                |           |           |      "; 
print "-------------------------------------------------"}
{sum+=$2}
{count+=$3}
{counter+=$2*$3}
{printf("%-15s | %-10s| %-10s| %-10s\n", $1, $2, currency $3, currency $2*$3)} 
END {printf("%-15s | %-10s| %-10s| %-10s\n", "TOTAL:", sum, currency count, currency counter)}' shopping.csv