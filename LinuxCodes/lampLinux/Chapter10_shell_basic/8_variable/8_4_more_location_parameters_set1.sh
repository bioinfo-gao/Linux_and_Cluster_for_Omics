#!/bin/bash
echo $0 $1 $2 $3 $4 $5 $6
shift
echo $0 $1 $2 $3 $4 $5 $6
shift 3
echo $0 $1 $2 $3 $4 $5 $6
echo $# $? $$ $! $*

# chmod 755 set1
# ./set1 11 22 33 444 55 666 