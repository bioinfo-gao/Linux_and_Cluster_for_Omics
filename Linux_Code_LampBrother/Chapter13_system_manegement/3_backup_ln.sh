#!/bin/bash
# 脚本功能：备份/etc 目录，并把备份文件放在 /tmp/dbback 目录下
# hard lnk 硬链接  ln 源文件 目标文件
# soft lnk 软链接 ln -s 源文件 目标文件
#date=$(date +%y%m%d) # 获取当前日期，格式为 年月日，
date=$(date +\%y\%m\%d) # contab %有特殊含义，不能直接使用，需要用转义符\转义     
size=$(sudo du -sh /etc)

if [ -d /tmp/dbback ]
    then
        echo "Date is $date" > /tmp/dbback/db.txt
        echo "size is $date" >>/tmp/dbback/db.txt
        cd /tmp/dbback
        tar -zcf etc_$date.tar.gz /etc db.txt &>/dev/null        # 把/etc 和上面刚生成的db.txt 一起进行压缩
        #tar -zcf mysql-lib_$date.tar.gz /var/lib/mysql  &>/dev/null
        rm -rf /tmp/dbback/db.txt
    else 
        mkdir /tmp/dbback
        echo "Date is $date" > /tmp/dbback/db.txt
        echo "size is $date" >>/tmp/dbback/db.txt
        cd /tmp/dbback
        tar -zcf etc_$date.tar.gz /etc db.txt &>/dev/null
        rm -rf /tmp/dbback/db.txt
fi

