#!/bin/bash
git init
echo "Reinitialized existing Git repository in /home/student/CSI6203/.git/"
git add .
git config --global user.email "bjwalker@our.ecu.edu.au"
git config --global user.name "bennysgitrepo"
read -p "Input your git comment: " gitComment
git commit -m "$gitComment"
git push -u origin master
exit 0