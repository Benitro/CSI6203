#!/bin/bash
#Ask the user to input the name of the folder they would like to create
read -p "Input the name of the folder you would like to create: " folderName
#Create folder with the user input of the folder name
mkdir "$folderName"
exit 0