#!/bin/bash
#Print the list of options to select, and ask the user to input a number from the list
echo -e "1. Create a folder \n2. List files in a folder \n3. Copy a folder \n4. Save a password \n5. Read a password \n6. Print newest file"
read -p "Type any number to proceed: " numScript
#If the number selected = a number in the case statement, then execute the command from the script
case $numScript in 
    "1")
        ./folderMaker.sh;;
    "2")
        ./folderLister.sh;;
    "3")
        ./folderCopier.sh;;
    "4")
        ./savedPassword.sh;;
    "5")
        ./readPassword.sh;;
    "6")
        #If this option is selected, user to input the command line argument (3 file name) to fulfil the requirement for the command
        read -p "Type three files: " fileVar
        ./newestFile.sh $fileVar;;
    *)
        #If invalid option is input, then print message 'Unknown input!'
        echo "Unknown input!";;
#Exit case statement, and close with exit code
esac
exit 0