#!/bin/bash
# Please use print  NOT printf
# BEGIN work an action in {},         before line opertatin
awk 'BEGIN{print "This is a transcript"} {printf $2 "\t" $4 "\t" $6 "\n" }'  ../data/student.txt
# printf %ni
# printf %m.nf