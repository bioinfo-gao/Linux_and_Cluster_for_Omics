#!/bin/bash
# bash while1b.sh output.txt
# Author Zhen Gao
# 08/13/2013

linecount=0
while read -r line
do
        # echo line is stored in $line
	echo $line
linecount=$(($linecount + 1))
done < $1
echo $linecount

