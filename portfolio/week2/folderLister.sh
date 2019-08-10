#!/bin/bash
#This asks the user for a input, and stores the input in the viewFolder variable
read -p "Input the name of the folder you would like to view:" viewFolder
#This passes the variable into the 'ls' command to view files within
ls $viewFolder
exit 0