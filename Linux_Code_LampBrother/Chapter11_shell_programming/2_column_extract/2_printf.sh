# for awk 
# print also works for awk, and add  \n automatically
# but linux has no print.

# %ns  输出字符串， n： 几个字符
# %ni  输出整数， n： 几个数字
# %m.nf  输出浮点数， m:总共几个位数 n：几个小数位数， %8.2 ：6位整数，2位小数

# \n 换行
# \r 回车
# \t 制表符  

# cd Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/Chapter11_shell_programming/

printf %s  1 2 3 4 5 6  
printf %s %s %s  1 2 3 4 5 6  
printf '%s %s %s'  1 2 3 4 5 6  
printf '%s %s %s\n'  1 2 3 4 5 6  

printf %s  ../data/studeng.txt         # only print string of the input  
cat   ../data/student.txt  | printf %s # Still Don't Work 
printf %s  $(cat ../data/student.txt)  #   Works 

printf '%s\t %s\t %s\t %s\t %s\t %s\t\n' $(cat ../data/student.txt)  #   Works 
 