#!/bin/bash
# cut ,awk 都是显示结果
# sed 是流编辑器，可以直接修改文件
# 实际应用是打印一些行， 并不修改原文件

# 默认输出所有数据， p 打印 (也就是输出)
sed '2p' ../data/student1.txt
# -n option， 则只有处理的行输出到屏幕, 第一行包含标题行
# -n option , 绝大多数情况下， -n 和p 联合使用
sed -n '2p' ../data/student1.txt

# 动作 d del from line 2 to line 4 
sed  '2,4d' ../data/student1.txt
# 动作 a -append option , 在某行之后
sed '2a hello' ../data/student1.txt
# 动作 i -insert option ， 在某行之前
sed '2i hello' ../data/student1.txt
# 动作 c replace a line 
sed '4c no such person' ../data/student1.txt
# 动作 s replace a string
sed '4s/99/55/g' ../data/student1.txt
#'-i' for write in the documents  修改输出的同时还直接修改原数据, 有危险！！
sed -i '5s/99/55/g' ../data/studentForSed_back.txt

# 动作 i 和 选项 -i 完全不同， i 是插入， -i是原地修改 
# 如果真要修改，用vim 或者vscode 修改，稳妥的多

# 选项实际上就三个: -n  -i -e (多动作同时执行)
# -e mutiple replace togethers
sed -e 's/Zhen//g;s/xiao//g' ../data/studentForSed.txt

#'\' means another line
sed '2i hello \
world' ../data/student1.txt

#replace a string
#replace a string in whole documents  

