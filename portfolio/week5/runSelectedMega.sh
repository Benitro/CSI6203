#!/bin/bash
black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'
clear='\033[0m'
while :
do 
#Print the list of options to select, and ask the user to input a number from the list
echo -e "\n${blue}***********************"${clear}
echo -e "${red}* Welcome to MegaMenu *${clear}"
echo -e "${blue}***********************${clear}"
echo -e "\n1. Create a folder \n2. List files in a folder \n3. Copy a folder \n4. Save a password \n5. Read a password \n6. Print newest file \n7. Improved Folder Copier (from Week 4) \n8. Calculator \n9. Improved Folder Copier (from Week 5) \n10. Loop 1 - 1000 (Iterations of 3) \n11. File Name \n12. Internet Downloader \n"
read -p "Type any number to proceed (or type 'exit' to close): " inputVar
if [ $inputVar = 'exit' ]; then
break
exit 0
else 
#If the number selected = a number in the case statement, then execute the command from the script
case $inputVar in 
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
        read -p "Type three files: " inputVar
        ./newestFile.sh $inputVar;;
    "7")
        read -p "Type the name of the txt file you would like to input: " inputVar
        ./folderCopier_v3 > $inputVar;;
    "8")
        read -p "Type a calculation you would like to perform: " inputVar
        ./Calculator.sh $inputVar;;
    "9")
        read -p "Type a start and end number to create a 'week'+number folder (i.e. 5 11): " inputVar
        ./megaFolderMaker.sh $inputVar;;
    "10")
        ./loop.sh;;
    "11")
        read -p "Type the name of the txt file you would like to confirm the type: " inputVar
        ./filenames.sh $inputVar;;
    "12")
        ./internetDownloader.sh;;
    *)
        #If invalid option is input, then print message 'Unknown input!'
        echo -e "${red}Unknown input!${clear}";;
#Exit case statement, and close with exit code
esac
fi
done
exit 0