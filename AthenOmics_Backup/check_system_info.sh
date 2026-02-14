# Shift + Enter 直接执行当前行的命令 in this AthenOmics computer,  some other system may Ctrl + Enter 执行当前行并换行

# 本系统拷贝方法： highlight 内容，鼠标点右键， 到新位置，鼠标点右键，选择粘贴（Paste）即可

cat /etc/os-release # 检查 Linux 发行版（Distro）最标准且信息最全的方法
uname -a # 显示系统内核版本和其他相关信息
hostnamectl # 显示主机名和系统信息, Best for checking the Linux distribution and version
lsb_release -a # 显示 Linux 发行版信息, 需要安装 lsb-release 包
cat /proc/cpuinfo # 显示 CPU 信息, 包括型号、核心数、线程数等，但信息过长无法检查
cat /proc/cpuinfo | grep processor # 显示 CPU 信息，0-55 共 56 个处理器核心
cat /proc/meminfo # 显示内存信息

nproc                # 查看可用核心数
lscpu #| grep "Model name"  # 查看具体型号
lscpu | grep "型号名称"  # 查看中文操作系统的具体型号

free -h              # 查看总内存、已用和剩余（重点看 Mem 总量）
#内存：      440Gi        74Gi       203Gi       1.2Gi       163Gi       362Gi

df -h                # 查看各挂载点的容量（重点检查 /home 或数据盘是否够大）
# 文件系统                   大小  已用  可用 已用% 挂载点
# tmpfs                       45G  7.3M   45G    1% /run
# /dev/sda2                  879G  109G  726G   13% /
# tmpfs                      221G  205M  221G    1% /dev/shm
# tmpfs                      5.0M  4.0K  5.0M    1% /run/lock
# efivarfs                   512K  119K  389K   24% /sys/firmware/efi/efivars
# /dev/sda1                  511M  6.1M  505M    2% /boot/efi
# /dev/mapper/centos11-home   15T   15T  365G   98% /home
# tmpfs                       45G  132K   45G    1% /run/user/1000
# tmpfs                       45G   60K   45G    1% /run/user/1003
# tmpfs                       45G   60K   45G    1% /run/user/0
# tmpfs                       45G   64K   45G    1% /run/user/1001

# Ubuntu 授予 sudo
usermod -aG sudo gaoz


conda --version      # 查看是否安装
conda info --envs    # 查看已有的虚拟环境（看看前任开发者留下了什么）

# docker --version     # 是否支持容器化部署（Nextflow 必备）
# conda：未找到命令
# gaoz@ ylxt-Super-Server  07:10 $ conda info --envs    # 查看已有的虚拟环境（看看前任开发者留下了什么）
# conda：未找到命令
# gaoz@ ylxt-Super-Server  07:10 $ docker --version     # 是否支持容器化部署（Nextflow 必备）
# Docker version 28.3.3, build 980b856

which python3 && python3 --version
# /usr/bin/python3
# Python 3.10.12
which R && R --version # NO R 

top

# 检查网络连接 
ping -c 3 www.google.com  # 检查是否能访问外网
# PING www.google.com (31.13.94.37) 56(84) bytes of data.
# --- www.google.com ping statistics ---
# 3 packets transmitted, 0 received, 100% packet loss, time 2050ms
ping -c 3 www.baidu.com  # 检查是否能访问国内网站
# 07:16 $ ping -c 3 www.baidu.com
# PING www.baidu.com (110.242.69.21) 56(84) bytes of data.
# 64 bytes from 110.242.69.21 (110.242.69.21): icmp_seq=1 ttl=49 time=9.56 ms
# 64 bytes from 110.242.69.21 (110.242.69.21): icmp_seq=2 ttl=49 time=9.54 ms
# 64 bytes from 110.242.69.21 (110.242.69.21): icmp_seq=3 ttl=49 time=9.72 ms
ping -c 3 www.hsph.harvard.edu  # 检查是否能访问哈佛大学公共卫生学院的网站
# PING www.hsph.harvard.edu (89.106.200.1) 56(84) bytes of data.
# 64 bytes from edge.redirect.pizza (89.106.200.1): icmp_seq=1 ttl=39 time=195 ms
# 64 bytes from edge.redirect.pizza (89.106.200.1): icmp_seq=2 ttl=39 time=195 ms
# 64 bytes from edge.redirect.pizza (89.106.200.1): icmp_seq=3 ttl=39 time=195 ms
# --- www.hsph.harvard.edu ping statistics ---
# 3 packets transmitted, 3 received, 0% packet loss, time 2001ms
# rtt min/avg/max/mdev = 195.273/195.350/195.494/0.101 ms
# --- www.baidu.com ping statistics ---
# 3 packets transmitted, 3 received, 0% packet loss, time 2003ms
# rtt min/avg/max/mdev = 9.543/9.606/9.719/0.080 ms


#综合自检脚本 (一键复制)
echo "--- CPU Info ---" && nproc
echo "--- Memory Info ---" && free -h
echo "--- Disk Info ---" && df -h | grep '^/dev/'
echo "--- OS Info ---" && cat /etc/os-release | grep "PRETTY_NAME"
echo "--- Conda Env ---" && conda info --envs | head -n 5

# 服务器 IP 是 47.93.78.21。
# 1. 快速查询结果
# 通过对该 IP 的 WHOIS 信息查询，可以得出以下结论：
# 服务提供商（ISP）: 阿里巴巴（Alibaba Cloud / 阿里云）。
# 该 IP 段属于阿里云的 Beijing Region（北京地域）。
# 物理位置: 中国，北京。
# 网络归属: 该 IP 属于 AS37963 (Hangzhou Alibaba Advertising Co.,Ltd.)。
hostnamectl
