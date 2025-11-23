#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)

port =$(nmap -sT 192.168.8.10  | grep tcp | grep http |awk '{print $2}')

echo $port
if [ "$port" == "open" ]
    then
        echo "The port is healthy"
    else
        echo "The port is closed , please take care"
fi
