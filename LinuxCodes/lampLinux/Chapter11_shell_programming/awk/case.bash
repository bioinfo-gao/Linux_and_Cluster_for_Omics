#!/bin/bash

echo 'Please input "1" if you want to book ticket to Shanghai'
echo 'Please input "2" if you want to book ticket to Guangzhou'
echo 'Please input "3" if you want to book ticket to Chengdu'

read -t 30 -p "plase input your choise in 1 or 2 or 3 only = " cho

case "$cho" in 
    "1")
        echo "ticket to Shanghai has been sold out"
        ;;
    "2")
        echo "ticket to Guangzhou booked"
        ;;
    "3")
        echo "ticket to Chengdu booked sucessfully"
        ;;
    *) ###################### Note here no ""
        echo "Error , please input 123 only"
        ;;
esac

