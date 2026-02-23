# Shift + Enter 直接执行当前行的命令 in this AthenOmics computer,  some other system may Ctrl + Enter 执行当前行并换行
# shift  enter 已经改成 运行当前行并前进到下一行
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
curl ipinfo.io/47.93.78.21
{
  "ip": "47.93.78.21",
  "city": "Beijing",
  "region": "Beijing",
  "country": "CN",
  "loc": "39.9075,116.3972",
  "org": "AS37963 Hangzhou Alibaba Advertising Co.,Ltd.",
  "postal": "100000",
  "timezone": "Asia/Shanghai",
  "readme": "https://ipinfo.io/missingauth"
}
# 彻底删除选中区域内的所有空行
# 如果你想把一个代码块里所有的空白行（包括只含空格、制表符的行）全部删掉：
# 选中你想要处理的代码块
# 按下 Ctrl + H (替换)
# 点击搜索框右侧的 .* 图标（或按 Alt + R）开启正则表达式模式
# 在 Find (查找) 输入： ^\s*$\n
# 在 Replace (替换) 
# 点击 Replace All
# Hardware Vendor: Supermicro (超微) 和 Hardware Model: Super Server，真相大白了：这不是云服务器，而是一台实实在在的物理服务器（裸金属服务器）。
# 它的 IP 地址 47.93.78.21 确实属于阿里云，但这说明这台物理机托管在阿里云的 IDC 机房（托管服务），或者使用了阿里云的专线公钥 IP。
# 1. 硬件分析
# 物理机身份：Supermicro 是全球著名的服务器硬件厂商。你现在是在直接操作一台高性能的物理硬件，而不是被限制了资源的虚拟机（KVM）。
# 性能潜力：物理服务器通常拥有大量的 CPU 核心和巨大的内存（RAM），非常适合跑极耗资源的生信流程（如基因组组装、大样本单细胞）。
# Ubuntu 22.04 + Kernel 6.5：这是一个非常现代且强大的环境，支持最新的 R 4.4 和各类底层驱动。
# 2. 为什么网络不通？
# 物理服务器在机房里通常受到物理防火墙或路由器 ACL 的限制。
# 出口被禁：机房管理员可能在交换机端禁止了这台机器主动访问外网，只留了 SSH 端口供你远程连接。
# 内网隔离：这台机器可能处于一个高安全级别的生信计算簇中。
# 1. 查看服务器一共有多少个账号
# Linux 的用户信息存储在 /etc/passwd 中。运行以下命令可以列出所有普通用户（避开系统自带的服务账号）：
# Bash
# Filter users with UID >= 1000 (usually human users)
grep -E '^[^:]+:[^:]+:[1-9][0-9]{3,}' /etc/passwd | cut -d: -f1
#Logic: 在 Ubuntu 中，普通用户的 UID（User ID）通常从 1000 开始。
# nobody
# ylxt
# muy
# songz
# jialh
# gaohao
# dev
# gaoz
#Alternative: 如果你想看所有账号（包括 root 和系统服务），直接输入 cat /etc/passwd | cut -d: -f1。
# 2. 查看哪些账号是管理员 (Sudoers)
# 在 Ubuntu 中，管理员通常被归类在 sudo 组中。你可以通过查看组文件来确认：
# Bash
# # Check who is in the 'sudo' group
getent group sudo | cut -d: -f4
# ylxt
#如果服务器是 CentOS 或 RedHat 风格，管理员组通常叫 wheel：

getent group wheel | cut -d: -f4
