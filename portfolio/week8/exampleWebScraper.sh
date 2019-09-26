#!/bin/bash

#exampleWeb=$(curl -s http://example.com)

#echo $exampleWeb

title=$(curl -s http://example.com | grep "<h1>" | sed -n "/<h1>/,/<\/h1>/p")

paragraph=$(curl -s http://example.com | grep "<p>" | sed -n "/<p>/,/<\/p>/p")

echo -e "$title\n$paragraph"