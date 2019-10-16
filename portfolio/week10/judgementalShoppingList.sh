#!/bin/bash

#Print the CSV file into a table, displaying the total for each row, and column

echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$";
print "Item            | Quantity  | Price     | Total     | Comment       "; 
print "                |           |           |           |               "; 
print "--------------------------------------------------------------------"}
{sum+=$2}
{count+=$3}
{counter+=$2*$3}
{if($2>5)
    printf "Do you really need that many?" $5
else if($2*$3 > 5)
    printf "That’s a bit expensive! Are you sure?" $5
else if($2*$3 < 3)
    printf "Such a cheapskate!" $5
}
{printf("%-15s | %-10s| %-10s| %-10s| %-10s\n", $1, $2, currency $3, currency $2*$3, $5)}
END {printf("%-15s | %-10s| %-10s| %-10s\n", "TOTAL:", sum, currency count, currency counter)}' ../week9/shopping.csv