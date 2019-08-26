#!/bin/bash

#Author: Ben Walker
#Edith Cowan University

echo 'Update all permission in weeks to execute recursively'
chmod +x ~/CSI6203/portfolio/"week1"/*.sh
chmod +x ~/CSI6203/portfolio/"week2"/*.sh
chmod +x ~/CSI6203/portfolio/"week3"/*.sh
chmod +x ~/CSI6203/portfolio/"week4"/*.sh
chmod +x ~/CSI6203/portfolio/"week5"/*.sh
cd ~/CSI6203/
tree
echo 'Done'
exit 0