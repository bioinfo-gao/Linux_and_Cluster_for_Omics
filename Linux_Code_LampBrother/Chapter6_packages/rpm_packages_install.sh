https://httpd.apache.org/download.cgi#apache24

Source: httpd-2.4.65.tar.bz2 
Source: httpd-2.4.65.tar.gz 

Apache 包名和包全名
包名 httpd
包全名 httpd-2.4.63-5.el10.x86_64.rpm

安装和升级需要包全名， 并进入正确路径
卸载搜索使用包名 系统去指定地址去查找 /var/lib/rpm 

#httpd-2.4.63-5.el10.x86_64.html	Apache HTTP Server	CentOS Stream 10 AppStream for x86_64	
# https://rpmfind.net/linux/rpm2html/search.php?query=httpd&submit=Search+...
# https://pkgs.org/

# 库 dependency 
rpm -ivh mysql-connector-odbc-8.0.37-1.fc41.i686.rpm
wget https://rpmfind.net/linux/opensuse/ports/aarch64/tumbleweed/repo/oss/aarch64/libodbc2-2.3.14-1.2.aarch64.rpm
rpm -ivh libodbc2-2.3.14-1.2.aarch64.rpm

warning: libodbc2-2.3.14-1.2.aarch64.rpm: Header V3 RSA/SHA512 Signature, key ID 29b700a4: NOKEY
error: Failed dependencies:
        ld-linux-aarch64.so.1()(64bit) is needed by libodbc2-2.3.14-1.2.aarch64
        ld-linux-aarch64.so.1(GLIBC_2.17)(64bit) is needed by libodbc2-2.3.14-1.2.aarch64

# 卸载
rpm -e httpd 

# query 
rpm -q httpd

# query all library in this computer 
rpm -qa
rpm -qa | grep httpd 

# 查询包的基本信息，包括住建和在本机安装的信息
rpm -i httpd
rpm -i git-core-2.47.3-1.el9_6.x86_64

# 查询未安装的包的信息
rpm -pi httpd libodbc2-2.3.14-1.2.aarch64.rpm 

# 查找包的安装位置
rpm -ql git

# 查询系统文件属于哪个包 
rpm -qf /usr/share/git-core/contrib/diff-highlight

# 查询未安装包的依赖性
rpm -qRp 

############################################################
# 为了解决依赖性问题， 发明了 yum 和 dnf 工具
# rpm包的 yum在线管理
ifconfig 
sudo ping www.google.com
ls /etc/yum.repos.d/
# oracle-linux-ol9.repo  uek-ol9.repo  virt-ol9.repo

yum list # 查询所有可用软件包
yum search httpd # 查询Apache related 软件包

sudo dnf install gcc -y  # 1min
sudo dnf -y update   # update all System # Strongly NOT recommmeded
sudo dnf -y update httpd  # 1 min 
  
yum grouplist # 查询所有可用软件group
yum groupinstall # install group