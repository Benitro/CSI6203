#!/bin/bash
git init
git add .
git config --global user.email "bjwalker@our.ecu.edu.au"
git config --global user.name "bennysgitrepo"
read -p "Input your git comment: " gitComment
git commit -m "$gitComment"
git push -u origin master
exit 0