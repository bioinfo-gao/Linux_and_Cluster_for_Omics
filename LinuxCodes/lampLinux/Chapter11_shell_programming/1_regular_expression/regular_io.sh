#!/bin/sh

# globbing 是搜索文件名的， 是精确匹配
# re 搜索文件中的字符串的， 是包含匹配

# grep awk sed 可以支持 re
# ls find cp 不支持正则表达式，只能使用shell 自己的通配符



dir='thsi is v1'
dir1=/Mathematics/Guests/goodegg
dir2=`pwd`
declare -a arr1
arr1[0]=234
arr1[1]=334
arr1[2]=5234
arr1[3]=234
arr1[4]=12234
declare -a arr2
arr2=(9 4 8 3)
echo -n"enter your name"
read Name
echo "Hello $Name"
ls $dir1
echo $dir
cat $dir1/cprog/105.c
echo $dir2
echo $(pwd)
echo ${arr1[4]}
echo ${arr2[2]}
echo ${arr1[*]}
echo ${arr2[@]}
read name
read a b c
echo $name
echo $a $b $c

