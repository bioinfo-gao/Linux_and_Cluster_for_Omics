# 源码包和rpm包在安装之后的区别，最大的一代就是安装位置
# 真实服务器上，任意软件只可能安装rpm包或者源码包，不可能都安装
#源码包一般在
/usr/local/软件名

# 因为安装位置不同，带来服务管理不同
/etc/rc.d/init.d/http start
service httpd start 

# 一切可执行文件，归根到底是安照绝对路径加名称启动

# service 会去默认位置去查找，能找到就能启动

# 源码包安装的包不能用 service 管理

/usr/local/apacha2/bin/apachectl start 

# 源码包只能用绝对路径管理

# 安装准备
# 安装 gcc # 已经安装

# 下载Apache源码包
# https://httpd.apache.org/docs/2.4/install.html

# Installing from source
# Download	Download the latest release from http://httpd.apache.org/download.cgi
# Extract	$ gzip -d httpd-NN.tar.gz
# $ tar xvf httpd-NN.tar
# $ cd httpd-NN
# Configure	$ ./configure --prefix=PREFIX
# Compile	$ make
# Install	$ make install
# Customize	$ vi PREFIX/conf/httpd.conf
# Test	$ PREFIX/bin/apachectl -k start

# 手动安装是的约定俗成的位置
# 源代码保存位置
/usr/local/src
# 软件安装位置
/usr/local


# ZG install process 
cd ~/Download
wget https://dlcdn.apache.org/httpd/httpd-2.4.65.tar.gz

tar -zxvf  httpd-2.4.65.tar.gz 
du -sh httpd-2.4.65
#49M     httpd-2.4.65
cd httpd-2.4.65
# ls
# focus 2 Import FILE: INSTALL README, 一个是安装说明，一个是使用说明 <<<============

#  cat INSTALL 
#   APACHE INSTALLATION OVERVIEW

#   Quick Start - Unix
#   ------------------

#   For complete installation documentation, see [ht]docs/manual/install.html or
#   http://httpd.apache.org/docs/2.4/install.html

#      $ ./configure --prefix=PREFIX
#      $ make
#      $ make install
#      $ PREFIX/bin/apachectl start

# ~/Download/httpd-2.4.65 :  
# gao@ DESKTOP-C8OKE65  00:40 $ ./configure --help
# 定义和自选功能选项
# 检测系统环境是否符合安装要求
# 把定义好的功能选项和检测系统环境的信息都写入Makefile, 用于后续的编辑

./configure --help
./configure --prefix=/usr/local/apache2
# checking host system type... x86_64-pc-linux-gnu
# checking target system type... x86_64-pc-linux-gnu
# configure: 
# configure: Configuring Apache Portable Runtime library...
# configure: 
# checking for APR... no
# configure: error: APR not found.  Please read the documentation.

sudo dnf install apr-devel apr-util-devel

# checking for chosen layout... Apache
# checking for working mkdir -p... yes
# checking for grep that handles long lines and -e... /usr/bin/grep
# checking for egrep... /usr/bin/grep -E
# checking build system type... x86_64-pc-linux-gnu
# checking host system type... x86_64-pc-linux-gnu
# checking target system type... x86_64-pc-linux-gnu
# configure: 
# configure: Configuring Apache Portable Runtime library...
# configure: 
# checking for APR... yes
#   setting CC to "gcc"
#   setting CPP to "gcc -E"
#   setting CFLAGS to " "
#   setting CPPFLAGS to " -DLINUX -D_REENTRANT -D_GNU_SOURCE"
#   setting LDFLAGS to " "
# configure: 
# configure: Configuring Apache Portable Runtime Utility library...
# configure: 
# checking for APR-util... yes
# checking for gcc... gcc
# checking whether the C compiler works... yes
# checking for C compiler default output file name... a.out
# checking for suffix of executables... 
# checking whether we are cross compiling... no
# checking for suffix of object files... o
# checking whether the compiler supports GNU C... yes
# checking whether gcc accepts -g... yes
# checking for gcc option to enable C11 features... none needed
# checking how to run the C preprocessor... gcc -E
# checking for -pcre2-config... no
# checking for -pcre-config... no
# checking for pcre2-config... no
# checking for pcre-config... no
# configure: error: pcre(2)-config for libpcre not found. PCRE is required and available from http://pcre.org/


sudo dnf install pcre-devel

# 建议一次性安装所有常见的编译依赖，以避免反复配置失败：
# Red Hat/CentOS/Rocky/AlmaLinux:
# code
# Bash
# sudo dnf install apr-devel apr-util-devel pcre-devel openssl-devel zlib-devel make gcc

# Debian/Ubuntu:
# code
# Bash
# sudo apt install libapr1-dev libaprutil1-dev libpcre3-dev libssl-dev zlib1g-dev build-essential

./configure --prefix=/usr/local/apache2

# config.status: creating build/pkg/pkginfo
# config.status: creating build/config_vars.sh
# config.status: creating include/ap_config_auto.h
# config.status: executing default commands
# configure: summary of build options:

#     Server Version: 2.4.65
#     Install prefix: /usr/local/apache2
#     C compiler:     gcc
#     CFLAGS:            
#     CPPFLAGS:        -DLINUX -D_REENTRANT -D_GNU_SOURCE  
#     LDFLAGS:           
#     LIBS:             
#     C preprocessor: gcc -E

make # 调用gcd 编译
# gcc: fatal error: cannot read spec file '/usr/lib/rpm/redhat/redhat-hardened-ld': No such file or directory
#compilation terminated.

# sudo dnf install redhat-rpm-config
# make clean  截至 make 这一步， 并无写入文件， 这一句可以彻底清除临时文件
sudo make install 

sudo /usr/local/apache2/bin/apachectl start

# service httpd stop # 停止rpm 安装的apache2

ifconfig 

# find the IP address 172.21.22.209
input the IP address in any webbrowser
The figure shows "It works!" （如截屏）

# uninstall
rm -rf /usr/local/apache2/ # NO any debris, 没有任何垃圾文件

# 不需要卸载命令
# 对外服务的高频软件建议源码安装，其他低频使用的，包括gcc yum 即可