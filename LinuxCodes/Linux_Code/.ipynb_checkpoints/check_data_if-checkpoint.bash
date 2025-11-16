#!/bin/bash
rate=$(df -h | grep "/dev/sda" | cut -d "%" -f 1 | awk '{printf $1 }' )
echo $rate

if [ $rate ]
    then 
        echo "Yes"
    else
        echo  "No"     
 fi        