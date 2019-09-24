#!/bin/bash

#Call to shorterTriangle scripts, and store the output into the variable
triangleScript=$(~/CSI6203/portfolio/week7/shorterTriangles.sh)

#Using grep to print the Area with double digits
echo "$triangleScript" | grep -E '\ Area: [0-9]{2}'