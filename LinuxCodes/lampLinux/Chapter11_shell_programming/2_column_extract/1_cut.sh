# 提取字符串
# cat ../data/student1.txt # 分割符必须是tab ， 不能是空格
# 实际上除了空白作为分割，有tab， ， ：等分隔符的， 尽量用cut
# cut -f 2 ../data/student1.txt 
cut -f 1 ../data/stu.txt 
cut -f 2 ../data/stu.txt 
cut -f 3 ../data/stu.txt 
cut -f 2,3  ../data/stu.txt 
# cut -d " " -f 2 ../data/student1.txt 
cut -d ":" -f 1,3 /etc/passwd 


# cut are used in pipeline
# find all users
cat /etc/passwd | grep /bin/bash | grep -v root |  cut -d ":" -f 1

# cut 对空格无效
df -h  | grep "sda5"
df -h  | grep "/mnt/wslg" | cut -f 5 
df -h  | grep "/mnt/wslg" | cut  -d "%" -f 1 
