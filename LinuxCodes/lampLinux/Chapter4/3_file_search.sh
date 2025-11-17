=========== ++++++++++++++++ Part I
# find file search, 默认精准搜索
find /etc/ -name init
sudo find /etc/ -name init
sudo find /etc -name init* # init 开头
sudo find /etc -name init??? # init + 3 characters
sudo find /etc -name inittab 
sudo find /etc -iname init* 

# +n, -n n 大于小于等于, 不能用如下搜索，因为wsl 能够搜索window11的硬盘，出现很多不应该出现的文件
sudo find / -type f -size +5G -exec ls -lh {} \; 2>/dev/null
# check how many Byte for 1 block 
sudo blockdev --getbsz /dev/sda 
# 4096  1 block = 4KB 
# -2048 2048   这里的数字是block， 需要把block 换算成 大写 
# 1M = 1024KB
# 100M = 102400KB = 25600 block
echo $((100 * 1024 * 1024 / 4096))  # 100M 文件换算成数据快

# -ok -exec
# -ok ask by each file,   hence -exec is much more popular
sudo find /home/gao -type f -size +100M -exec ls -lh {} \; 2>/dev/null

sudo find /etc -name *init* -a -type f -exec ls -l {} \; # must keep the space "{} \;""
sudo find /etc -name *init* -a -type f -ok ls -l {} \; # {} \;  space is needed! 

# 查找shencao的所有文件 -user 
sudo find /home -user shencao #
sudo find /home -user shencao -ok rm  {} \; ##
# -group
sudo find /home -group meinv #

# inode number 
sudo find . -inum 19275595   -exec rm  {} \; ## 删除顽固文件
sudo find . -inum 19275595   -exec ls -l  {} \; ## 展示详细信息

# -type f d l
# 注意原始方法是找block数目，而且恒定在512Byte， 不是本机4096Byte就改成4096， 所以会找出来 15M的文件
sudo find /home/gao -type f -size +25600 -exec ls -lh {} \; 2>/dev/null # 查找大于 $12.5\text{ MB}$ 的文件
sudo find / -type f -size +5G -exec ls -lh {} \; 2>/dev/null # 单位有c K M G 

find /etc -size +100 # 100 block, 4096 in this linux 
sudo find /etc -size +100  -a -size -2000 # larger than 100 block and less 2000 block
#  -o or 

find /etc -user gao # 100 block, 4096 in this linux 






# 1. 过去10分钟内被修改过的文件
find /your/path -mmin -10

# 2. 过去30分钟内没人访问过的文件（适合清理临时文件）
find /tmp -amin +30 -type f

# 3. 过去1小时内被修改但没被访问过的文件（可能正在被后台程序写）
find . -mmin -60 -amin +60

# 4. 过去5分钟内被 chmod 或 chown 过的敏感文件（安全监控必备）
find /etc /usr/bin /usr/sbin -cmin -5

# 5. 精确到1分钟前修改的文件（监控实时日志）
find /var/log -mmin -1 -name "*.log"

# 与 -atime / -ctime / -mtime 的区别（天 vs 分钟)


help find
man find
# -amin access time, 
# -cmin file status-e.g. owner 文件属性
# -mmin content modification 
find /etc -cmin -5   # less than 5min 

sudo tune2fs -l /dev/sda1 | grep -i 'block size'
# Block size:       1024

lsblk -o NAME,PHY-SeC # chek th block size 4096


=========== ++++++++++++++++ Part II 

# sudo apt install locate # debian 
# sudo dnf install mlocate # or sudo yum install mlocate
# sudo updatedb # mlocate 程序本身已安装，但它的自动数据库更新功能（定时器）未能成功配置。
locate service
locate -i service  # 
locate inittab
locate locate  # /tmp not indexed


# which command 
which ls      # see the dir color  is alias
ls -l
/usr/bin/ls -l # use the raw command directly
which rm
which cd               # No path are buildin command 
which umask

whereis umask   # 命令和帮助信息
whereis passwd  # 命令和配置文件
whatis  passwd

clear # = Ctrl + l
cp -r tmp1_ZG/ tmp3_ZG/
sudo cp /etc/services  .
sudo cp /etc/inittab .
cp services  services2
cp services  services3
cp -r /home/gao/Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/tmp .

cat inittab
grep service /etc/inittab
grep -v ^#  /etc/inittab # -v  ;  Begninging # 
grep world file.txt
grep -i world file.txt 


gzip services2
gzip tmp2_ZG 
gzip   tmp2_ZG.tar tmp2_ZG # Only for FIles

