#!/bin/bash

sed '2p' student.txt
# -n option
sed -n '2p' student.txt
# -n option
sed  '2,4d' student.txt
# -append option
sed '2a hello' student.txt
# -insert option 
#'\' means another line
sed '2i hello \
world' student.txt
# replace a line 
sed '4c no such person' student.txt
# replace a string
sed '4s/99/55/g' student.txt
#replace a string
#'i' for write in the documents
sed -i '4s/99/55/g' studentForSed.txt
#replace a string in whole documents  
#'e' mutiple replace togethers
sed -e 's/Zhen//g;s/xiao//g' studentForSed.txt

