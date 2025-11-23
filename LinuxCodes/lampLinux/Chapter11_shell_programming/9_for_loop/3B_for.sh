#!/bin/bash

#  这个是为了批量解压缩，因为local没有这么多压缩文件，进入主目录

cd ~
ls *.tar.gz > ls.log 

y=1
for i in $(cat ls.log)
    do 
        echo $y $i
        tar -zxf $i &> /dev/null 
        # tar -zcf $i &> /dev/null # 解压缩
        echo $?
        y=$(( $y +1 ))
    done

rm -rf ls.log
