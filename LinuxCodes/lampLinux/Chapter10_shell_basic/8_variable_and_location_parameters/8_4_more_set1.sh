#!/bin/bash
echo $0 $1 $2 $3 $4 $5 $6
shift
echo $0 $1 $2 $3 $4 $5 $6
shift 3
echo $0 $1 $2 $3 $4 $5 $6
echo $# $? $$ $! $*


# $?  上一条命令的返回状态，0 表示正确， $$  和 || 就是取这个值 
# $$  当前进程进程好
# $!  后台运行的最后一个进程的进程号

# find /home/gao  -name zhengao  & 
# &  background run
# nohup : logout 不影响继续执行 

# chmod 755 8_4_more_set1.sh
# ./8_4_more_set1.sh 11 22 33 44 55 66 7777 8888
# ./8_4_more_set1.sh 11 22 33 44 55 66
# ./8_4_more_set1.sh 22 33 44 55 66 7777
# ./8_4_more_set1.sh 55 66 7777 8888
# 4 0 20723 55 66 7777 8888