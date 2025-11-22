#!/bin/bash
# ls *.sh  > ls.log
for i in $(cat ls.log)
    do
        echo  $i
    done     



#cd /root/sh
cat /etc/shells > ls_shells.log
y=0
for i in $(cat ls_shells.log)
    do
        echo  $i
        y=$(( $y +1 ))      
        echo $y      
    done        