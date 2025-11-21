#!/bin/bash 
# location parameters

# The for loop run only 1 times
for i in "$*"
    do
        echo "The paramter is $i"
    done
x=1
# The for loop run as many times as $@ numbers
for y in "$@"
    do
        echo "The paramter $x is:  $y"
        x=$(( $x+1 ))
    done
# bash 8_3D_location_parameter.sh 12 23 44 56 88 77 

# The paramter is 12 23 44 56 88 77

# The paramter is 12
# The paramter is 23
# The paramter is 44
# The paramter is 56
# The paramter is 88
# The paramter is 77