# (3) =============后台运行进程 & 和 nohup
vmstat  2 3 # 在后台运行 vmstart 命令，参数为2和3, 每2秒刷新一次，共刷新3次，刷新延时，刷新次数 结果显示在终端
vmstat  --help # 在后台运行 vmstart 命令，参数为2和3
vmstat
# top ===> top 5 lines 

dmesg  # 查看系统资源，包括各种硬件信息和内核日志
dmesg  | grep GPU # 查看系统资源，包括各种硬件信息和内核日志
dmesg  | grep CPU # 查看系统资源，包括各种硬件信息和内核日志

# CPU0: AMD Ryzen 5 5600H with Radeon Graphics (family: 0x19, model: 0x50, stepping: 0x0)
sudo lshw -C display

free -h  # 查看内存 and swap 使用情况，-h表示以人类可读的格式显示
free -m  # 查看内存 and swap 使用情况，-m表示以MB为单位显示

cat /proc/cpuinfo  # 查看CPU信息 
cat /proc/cpuinfo |grep buffer # 查看CPU信息 
cat /proc/meminfo | grep -E "Buffers|Cached|MemAvailable" # 查看内存信息
model name      : AMD Ryzen 5 5600H with Radeon Graphics

cpu MHz         : 3293.724
cache size      : 512 KB
Buffers:        : 24172 kB


lscpu               # 查看CPU信息


uptime              # 查看系统运行时间和负载情况
w                 # 查看当前登录用户和系统负载情况

uname
uname -a            # 查看系统内核版本和其他信息
uname -r            # 查看系统内核版本

file /bin/ls   # 外部命令 file 用于确定文件类型，顺带显示文件系统结构信息

lsb_release -a   # 查看Linux发行版信息

lsof -i        # 查看系统网络连接情况
lsof -c init  #

# /bin/ls: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=39ce614fe25904d7d7db920df264c080e2cda850, for GNU/Linux 3.2.0, stripped

# windows11 powershell check cpu info
wmic cpu get /all /format:list