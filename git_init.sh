#!/bin/bash
git init
git add .
read -p "Input your git user.email: " userEmail
git config --global user.email "$userEmail"
read -p "Input your git user.name: " userName
git config --global user.name "$userName"
read -p "Input your git comment: " gitComment
git commit -m "$gitComment"
git push -u origin master
exit 0