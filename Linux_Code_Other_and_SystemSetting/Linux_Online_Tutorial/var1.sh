#!/bin/bash
VARIABLE_NAME=ZhenGao
echo $VARIABLE_NAME
echo ${VARIABLE_NAME}
echo "$VARIABLE_NAME"
echo "${VARIABLE_NAME}"

printf "$VARIABLE_NAME\n"
printf "String %s\n" $VARIABLE_NAME
num=2013.88
printf "Signed Decimal Number %d\n" $num
now=$(date)
printf "Floating Point Number %f\n" $now
n=10
echo "The path is set to %s\n" $n
