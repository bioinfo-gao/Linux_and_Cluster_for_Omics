#!/bin/bash
linecount=0
while read  line
do
        # echo line is stored in $line
	echo $line
linecount=`expr $linecount + 1`
done < $1
echo $linecount

