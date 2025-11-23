#!/bin/bash
# (1)
# BEGIN work an action in {},         before line opertatin
awk 'BEGIN{print "This is a transcript"} {printf $2 "\t" $4 "\t" $6 "\n" }' ../data/student.txt 

# (2)
# specify seperator before line operation 
# 在读取第一行之前先读取分隔符
awk 'BEGIN{FS=":"} {printf $2 "\t" $4 "\t" $6 "\n" }' /etc/passwd
awk 'BEGIN{FS=":"} {print $2 "\t" $4 "\t" $6 "" }' /etc/passwd

# 注意，没有先加 BEGIN， 那么第一行不能正确处理
awk '{FS=":"} {print $2 "\t" $4 "\t" $6 "" }' /etc/passwd #
# printf %ni
# printf %m.nf