#!/bin/bash

s=0
for (( i=1; i<=100; i=i+1 ))
    do  
        s=$(( $s + $i ))      
    done        
    
echo "The total sum fom 1 to 100 is  $s"

