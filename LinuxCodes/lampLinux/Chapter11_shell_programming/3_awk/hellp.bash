#! /usr/bin/bash
echo "hello world!"

##!/bin/bash
read -p "Enter a password" pass
if test "$pass" = "jerry"
then
     echo "Password verified."
else
     echo "Access denied."	
fi

##### 
until nc -z 127.0.0.1 25565
do
    echo ...
    sleep 1
done

while true; do
read -p "Enter some words to demon or q for quit)" words
    if [ -z "$words" ]; then
        echo "Your must input somewords or q"
        continue
    elif [ "$words" == "q"  ]; then
        echo "Your ask to quit"
        break
    else    
        echo $words
    fi
    
done

while true; do
words=""
s=0
read -p "Enter some integer to calculate cubic or q for quit)" words
    if [ -z "$words" ]; then
        echo "Your must input somewords or q"
    elif [ "$words" == "q"  ]; then
        echo "Your ask to quit"
        break
    else    
        echo "you have some input", $words
        s=$(( $words*2 ))      
        echo $s
    fi
done

#echo "The command output changed!"

a=(10 30 44 44 69 12 11)


for v in ${a[@]}; do
    if (( $v > $max )); then max=$v; fi; 
done
echo $max

myvar=`cat`

echo "$myvar"

arr=()
arr+=('Hello' 'World')
arr+=('!')
echo ${arr[*]}


lines="
1st
2nd 
3dn
"
args=()
for i in $lines; do
    args+=("$i")
    echo "${args[@]}"
done
echo "${args[@]}"