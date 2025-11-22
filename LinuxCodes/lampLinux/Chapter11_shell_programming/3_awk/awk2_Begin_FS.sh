#!/bin/bash
# Please use print  NOT printf
# BEGIN work an action in {},         before line opertatin
awk 'BEGIN{print "This is a transcript"} {printf $2 "\t" $4 "\t" $6 "\n" }' ../data/student.txt 
# specify seperator
# awk 'BEGIN{FS=":"} {printf $2 "\t" $4 "\t" $6 "\n" }' /etc/passwd
awk 'BEGIN{FS=":"} {printf $2 "\t" $4 "\t" $6 "\n" }' /etc/passwd
# printf %ni
# printf %m.nf