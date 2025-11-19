#!/bin/bash
# Please use print  NOT printf
# BEGIN work an action in {},         before line opertatin
# specify seperator
cat /etc/passwd | grep "/bin/bash" | awk '{printf  $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $7 "\n" }' 
