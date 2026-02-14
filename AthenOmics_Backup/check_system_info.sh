# Shift + Enter 直接执行当前行的命令 in this AthenOmics computer,  some other system may Ctrl + Enter 执行当前行并换行
# 本系统拷贝方法： highlight 内容，鼠标点右键， 到新位置，鼠标点右键，选择粘贴（Paste）即可

cat /etc/os-release # 检查 Linux 发行版（Distro）最标准且信息最全的方法
uname -a # 显示系统内核版本和其他相关信息
hostnamectl # 显示主机名和系统信息, Best for checking the Linux distribution and version
lsb_release -a # 显示 Linux 发行版信息, 需要安装 lsb-release 包
cat /proc/cpuinfo # 显示 CPU 信息, 包括型号、核心数、线程数等，但信息过长无法检查
cat /proc/cpuinfo | grep processor # 显示 CPU 信息，0-55 共 56 个处理器核心
cat /proc/meminfo # 显示内存信息
# Ubuntu 授予 sudo
usermod -aG sudo gaoz