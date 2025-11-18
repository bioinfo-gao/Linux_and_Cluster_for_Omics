目录结构
###### The root directory of the file system (/)
1. /
###### The commands in the following directories are commonly and  the last two directories are used by system administrators:
2. /bin
3. /sbin
4. /usr/bin
5. /usr/sbin
   
6. /boot
   
7. /dev
   
8.  /etc # configuration files
   
9.  home  # home directories for users
   
10. /lib # library files

11. /lost+found # recovery directory for deleted files each <font color="blue">each partition</font> has a lost+found directory

###### 只有空目录才能用作挂载点，其他目录都不能用作挂载点。
11. /media # mount point for removable media   
12. /mnt   # mount point for temporary mounting
13. /misc  # miscellaneous devices and filesystems
   
14. /opt       # optional add-on software
    /usr/local # 更通用的第三方软件保存位置


###### The following directories are virtual and cannot be created by users:    
15. /proc # virtual file system for process information
16. /sys # virtual file system for system/kernel information
   
17. /root  # home directory for the root user

18. /usr   # 系统资源目录: Unix Software Resource, NOT user data!

18. /var  # variable data, such as logs, databases, and caches
19. /run  # temporary directory for runtime data
   
20. /srv # data for servers,  为各种服务数据提供一个目录
   
   
21. /tmp # temporary directory
   
 