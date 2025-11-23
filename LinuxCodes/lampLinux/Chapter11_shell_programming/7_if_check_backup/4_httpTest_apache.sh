#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)

port =$(nmap -sT 192.168.8.10  | grep tcp | grep http |awk '{print $2}')

echo $port
if [ "$port" == "open" ]
    then
        echo "The port is healthy"
    else
        /etc/rc.d/init.d/httpd start &>/dev/null 
        echo "The port is closed for some reason, please take care or check"
fi
