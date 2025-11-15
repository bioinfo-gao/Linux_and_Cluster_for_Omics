#!/bin/sh
#To test the variables
USER=haison
echo "Hello,$USER,the output of this script are as
follows:"
echo "The script name
is :` basename $0`"
echo "The first param of the script is :$1"
echo "The second param of the script is :$2"
echo "The tenth param of the script is :$10"
echo "All the params you input are :$ *"
echo "The number of the params you input are:$#"
echo "The process ID for this script is :$$"
echo "The exit status of this script
is :$?"

