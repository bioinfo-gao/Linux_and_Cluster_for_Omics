#!/bin/bash
# while is not fixed cycle, it's conditional cycle

i=1
s=0
until [ $i -gt 100 ] # note the -
    do  
        s=$(( $s + $i ))      
        i=$(( $i + 1 ))      
    done        
    
echo "The total sum fom 1 to 100 is  $s"

