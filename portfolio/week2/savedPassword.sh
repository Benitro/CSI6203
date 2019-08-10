#!/bin/bash
#Ask the user for a folder, and pass the input into the variable openFolder
read -p "Input the name of the folder you would like to open:" openFolder
#Open the folder from the input of the variable openFolder
cd $openFolder
#Ask the user to input a secret password, and pass the input into the variable savePassword
read -p "Input a secret password:" savePassword
#Create a txt file, and input the variable of savePassword
echo $savePassword >secret.txt
exit 0