echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; currency="$"; 
print "Item            | Quantity  | Price     | Total"; 
print "                |           |           |      "; 
print "-------------------------------------------------"}
{printf("%-15s | %-10s| %-10s| %-10s\n", $1, $2, currency $3, currency $2*$3)}' shopping.csv