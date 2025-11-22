#!/bin/bash
# Please use print  NOT printf (datail in dir: 2_column)
# awk之所以存在，注意是因为空格难以处理，尤其是按列提取
# 实际上除了空白作为分割，有tab， ， ：等分隔符的， 尽量用cut
# 格式 awk 【条件】 打印  文件

awk '{printf $2 "\t" $4 "\t" $6 "\n" }' ../data/student.txt #  df_info.txt
awk '{print $1 "\t" $3 "\t" $5  }'      ../data/student.txt #  df_info.txt



df  -h
#df -h | awk '{print $2 "\t" $4 "\t" $5 "\t" $6  }' # print is better than printf, no \n needed
df -h | grep sda | awk '{print $5  }' | cut -d "%" -f 1 # print is better than printf, no \n needed
# printf %ni
# printf %m.nf