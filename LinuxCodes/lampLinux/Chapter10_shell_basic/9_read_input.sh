#1/bin/bash
read -t 15 -p "please enter your name " name
echo "your name is $name"

read -s -p "please enter your age " age
echo "your age is $age"

read -n 1 -p "please enter your gender [M/F] " gender
echo "your gender is $gender"

# -p  打印的提示信息
# -t  等待秒数
# -n  接受的字符数
# -s  隐藏输入