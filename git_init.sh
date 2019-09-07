#!/bin/bash
git init
git add .
#read -p "Input your git user.email: " userEmail
git config --global user.email "bjwalker@our.ecu.edu.au"
#read -p "Input your git user.name: " userName
git config --global user.name "bennysgitrepo"
read -p "Input your git comment: " gitComment
git commit -m "$gitComment"
git push -u origin master
exit 0