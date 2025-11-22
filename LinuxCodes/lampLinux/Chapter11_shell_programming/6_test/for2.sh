#!/bin/bash

y=0

for (( i=1;i<=100;i=i+1 ))
    do 
        y=$(( $y+$i ))
    done
echo $y
