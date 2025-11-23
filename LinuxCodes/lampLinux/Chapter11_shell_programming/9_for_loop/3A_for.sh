#!/bin/bash

#  这个是为了批量解压缩，因为local没有这么多压缩文件，做了修改
#  解压缩见3B

cd ~/Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/Chapter11_shell_programming/9_for_loop
ls *.sh > ls.log

y=1
for i in $(cat ls.log)
    do 
        echo $y $i
        echo $?
        y=$(( $y +1 ))
    done


rm -rf ls.log
