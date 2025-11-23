#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)

rate=$(df -h| grep "/dev/sda" | awk '{print $5}'| cut -d "%" -f1)
#get rate of using

echo $rate
if [ $rate -lt 20 ]
then
    echo "The system is healthy"
else
    echo "The disk is nearly fully, please take care"
fi
