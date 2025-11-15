#!bin/bash

echo 'If you want to buy ticket to Shanghai, please input "1"'
echo 'If you want to buy ticket to Guangzhou, please input "2"'
echo 'If you want to buy ticket to Chengdu, please input "3"'

read -t 30 -p "Please input your choice: " cho

case "$cho" in
    "1")
        echo "The Price is 1000"
        ;;
    "2")
        echo "The Price is 2000"
         ;;
    "3")
        echo "The Price is 3000"
        ;;

     *)
        echo "You have to input 1 or 2 or 3"
         ;;
esac
