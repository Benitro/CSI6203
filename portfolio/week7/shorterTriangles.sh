#!/bin/bash

triangles=$(~/CSI6203/portfolio/week6/triangles.sh)

shortTri=$(echo "$triangles" | sed -n '/.*The area for triangle with.* / {
s/.*base/Base/
s/and*//
s/height/Height/
s/is/Area/
p
}')

echo -e "$shortTri"