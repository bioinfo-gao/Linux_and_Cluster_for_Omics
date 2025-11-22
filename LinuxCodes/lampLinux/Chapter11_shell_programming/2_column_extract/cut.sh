
# cat ../data/student1.txt # 分割符必须是tab ， 不能是空格
# cut -f 2 ../data/student1.txt 
# cut -f 3 ../data/student1.txt 
# cut -f 4  ../data/student1.txt 
# cut -f 2,3  ../data/student1.txt 
# cut -d " " -f 2 ../data/student1.txt 
cut -d ":" -f 1,3 /etc/passwd 

