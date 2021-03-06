#!/bin/bash

#Print the CSV file into a table, display the Item, Quality, Price, Total, and the Comment

echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$";
print "Item            | Quantity  | Price     | Total     | Comment       "; 
print "                |           |           |           |               "; 
print "--------------------------------------------------------------------"}
{sum+=$2}
{count+=$3}
{counter+=$2*$3}
{printf("%-15s | %-10s| %-10s| %-10s| %-10s\n", $1, $2, currency $3, currency $2*$3, ($2>5) ? "Do you really need that many?" : ($2*$3 > 5) ? "That’s a bit expensive! Are you sure?" : ($2*$3 < 3) ? "Such a cheapskate!" : "")}
END {printf("%-15s | %-10s| %-10s| %-10s\n", "TOTAL:", sum, currency count, currency counter)}' ../week9/shopping.csv