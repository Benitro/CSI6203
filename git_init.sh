#!/bin/bash
git init
git add .
#read -p "Input your git user.email: " userEmail
git config --global user.email "insert email here"
#read -p "Input your git user.name: " userName
git config --global user.name "insert user name here"
read -p "Input your git comment: " gitComment
git commit -m "$gitComment"
git push -u origin master
exit 0
