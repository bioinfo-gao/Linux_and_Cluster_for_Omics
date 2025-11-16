#!/bin/bash
# Please use print  NOT printf
# BEGIN work an action in {},         before line opertatin
# specify seperator
cat  student.txt | grep -v "Name" | awk '$5 >=50 {print  $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5  }' 
