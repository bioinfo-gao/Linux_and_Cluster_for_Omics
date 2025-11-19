#!/bin/bash
# location parameters
#=== call with ==== bash parameter1.sh 11 22 33
# for i in $* # No quoto, print individual
#     do
#         echo $i
#     done      
# for i in "$*" # no quote meana as a whole 
#     do
#         echo $i
#     done      

# for i in $@ # No quoto, print individual
#     do
#         echo $i
#     done      

for i in "$@" # no quote meana as a whole 
    do
        echo $i
    done      
