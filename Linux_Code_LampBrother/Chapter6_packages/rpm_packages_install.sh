https://httpd.apache.org/download.cgi#apache24

Source: httpd-2.4.65.tar.bz2 
Source: httpd-2.4.65.tar.gz 


Apache 包名和包全名
包名 httpd
包全名 httpd-2.4.63-5.el10.x86_64.rpm

#httpd-2.4.63-5.el10.x86_64.html	Apache HTTP Server	CentOS Stream 10 AppStream for x86_64	
# https://rpmfind.net/linux/rpm2html/search.php?query=httpd&submit=Search+...
# https://pkgs.org/

# 库 dependency 
rpm -ivh mysql-connector-odbc-8.0.37-1.fc41.i686.rpm
wget https://rpmfind.net/linux/opensuse/ports/aarch64/tumbleweed/repo/oss/aarch64/libodbc2-2.3.14-1.2.aarch64.rpm
rpm -ivh libodbc2-2.3.14-1.2.aarch64.rpm
rpm -ivh libodbc2-2.3.14-1.2.aarch64.rpm

warning: libodbc2-2.3.14-1.2.aarch64.rpm: Header V3 RSA/SHA512 Signature, key ID 29b700a4: NOKEY
error: Failed dependencies:
        ld-linux-aarch64.so.1()(64bit) is needed by libodbc2-2.3.14-1.2.aarch64
        ld-linux-aarch64.so.1(GLIBC_2.17)(64bit) is needed by libodbc2-2.3.14-1.2.aarch64


# 为了解决依赖性问题， 发明了 yum 和 dnf 工具
sudo dnf install httpd