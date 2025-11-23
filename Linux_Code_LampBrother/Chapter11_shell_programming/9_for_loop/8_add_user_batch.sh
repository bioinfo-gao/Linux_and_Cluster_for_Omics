#!/bin/bash
# add a group of user with specified amount
# Author Zhen Gao (zhen.gao@yahoo.com)

#!/bin/bash

# 1. 获取用户输入
read -p "Please input group user name: " -t 30 name
read -p "Please input user num: " -t 30 num
read -p "Please input temporaty group user password: " -t 30 pass

# 2. 检查输入是否为空 (name, num, pass 都不为空)
#if [ ! -z $name -a ! -z $num -a ! -z $pass ]; then # Both $name and "$name" works
if [ ! -z "$name" ] && [ ! -z "$num" ] && [ ! -z "$pass" ]; then  # this one much clear
    
    # 3. 验证 $num 是否为纯数字
    # sed 移除所有数字后，$y 应该为空
    y=$(echo "$num" | sed 's/[0-9]//g')

    if [ -z "$y" ]; then
        echo "Creating $num users named ${name}1 to ${name}${num}..."

        # 4. 使用正确的 Bash C 风格 for 循环
        for (( i = 1; i <= $num; i++ )); do
            
            USERNAME="${name}${i}" # 构建用户名，例如 user1, user32

            # 添加用户 (抑制错误输出)
            useradd "$USERNAME" &> /dev/null

            # 设置密码 (通过管道和 --stdin 方式设置密码)
            echo "$pass" | passwd --stdin "$USERNAME" &> /dev/null
            
            if [ $? -eq 0 ]; then
                echo "User $USERNAME created successfully."
            else
                echo "Error creating user $USERNAME."
            fi
            
        done
    else
        echo "Error: User number ($num) contains non-digit characters."
    fi

else
    echo "Error: All fields (Name, Number, Password) must be provided."
fi

# sudo bash 8_add_user_batch.sh 


