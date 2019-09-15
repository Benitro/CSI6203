#!/bin/bash

triangles=~/CSI6203/portfolio/week6/triangles.sh

shortTri=$(echo "$triangles" | sed 's/base/Base: /p')

$shortTri