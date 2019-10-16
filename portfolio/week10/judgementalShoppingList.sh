#!/bin/bash

#Print the CSV file into a table, displaying the total for each row, and column

awk 'function comment(digit){
if($2>5)
    printf "Do you really need that many?" digit
else if($2*$3 > 5)
    printf "That’s a bit expensive! Are you sure?" digit
else if($2*$3 < 3)
    printf "Such a cheapskate!" digit
}'

echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$";
print "Item            | Quantity  | Price     | Total     | Comment       "; 
print "                |           |           |           |               "; 
print "--------------------------------------------------------------------"}
{sum+=$2}
{count+=$3}
{counter+=$2*$3}
{printf("%-15s | %-10s| %-10s| %-10s| %-10s\n", $1, $2, currency $3, currency $2*$3, comment($0))}
END {printf("%-15s | %-10s| %-10s| %-10s\n", "TOTAL:", sum, currency count, currency counter)}' ../week9/shopping.csv