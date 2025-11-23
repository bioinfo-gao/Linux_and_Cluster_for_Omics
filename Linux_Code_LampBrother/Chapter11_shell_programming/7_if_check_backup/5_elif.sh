#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)

read -t 300 -p "Please input a filename: " file

echo $file
if [ -z $file  ]
then
    echo "Error, Your didn't input a filename "
    exit 1
elif [ ! -e $file ]    
then
    echo "Your input is NOT a filename "
    exit 2
elif [ -f $file ]    
then
    echo "Your input is a regular filename "
elif [ -d $file ]    
then
    echo "Your input is a directory "

else
    echo "The $file is an other type of file"
fi

# Please input a filename: /home/gao/testfile.bz2