#!/bin/bash

#Call to the triangles script in the week6 folder
triangles=$(~/CSI6203/portfolio/week6/triangles.sh)

#Print the output of the triangles script, and strip the content out using sed, and replace the Base, Height, and Area
shortTri=$(echo "$triangles" | sed -n '/.*The area for triangle with.* / {
s/.*base/Base/
s/and*//
s/height/Height/
s/is/Area/
p
}')

#Print the output of shortTri variable
echo -e "$shortTri"