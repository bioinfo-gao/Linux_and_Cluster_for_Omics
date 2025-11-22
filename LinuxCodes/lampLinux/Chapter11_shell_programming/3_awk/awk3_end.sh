#!/bin/bash
# Please use print  NOT printf
# BEGIN work an action in {},         before line opertatin
# specify seperator
# awk 'BEGIN{FS=":"} {printf $2 "\t" $4 "\t" $6 "\n" }' /etc/passwd
awk 'BEGIN{FS=":"} END{print "Fine END LINE ===========================" } {printf $2 "\t" $4 "\t" $6 "\n" }' /etc/passwd
# printf %ni
# printf %m.nf