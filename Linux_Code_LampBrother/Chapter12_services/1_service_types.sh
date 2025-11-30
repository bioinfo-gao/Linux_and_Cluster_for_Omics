# (1) =======Types ===========================================================

# 1.1 RPM package manager service
# sudo systemctl start rpm-ostree.service
# 1.1.1 independent service
# 1.1.2 xinetd based service

# 1.2 Raw Code package manager service
# sudo systemctl start rpm-ostree.service


# (2) ====== check the service ===============================================
# 2.1 RPM based service 自动启动服务
#sudo systemctl is-enabled sshd.service
# 没有强制规定，包作者自己定义位置，但一般都在以下位置：约定俗成
# /etc/
# /etc/rc.d/init.d/sshd start
# /etc/init.d/         --> /etc/rc.d/init.d/
# /etc/                 # configuration files
# /etc/xinetd.conf      # xinetd configuration file
# /etc/ssh/sshd_config  # sshd configuration file
# /var/log/sshd.log     # log files
# /var/lib/sshd/        # variable files 

# /var/wwww/
# /usr/lib/systemd/system/sshd.service  # service file ???

chkconfig --list　# 列出所有服务及其运行级别信息

# 2.2 Raw Code based service 自动启动服务


#　无法用systemctl检查，需要查看配置文件
/usr/local/ 
/usr/local/apache2/bin/apachectl -k start 


# (3) ======Service Start and Auto-Start ==============================================

# (1) 绝对路径加服务名 + start|stop|status|restart
/etc/init.d/ssh   # start|stop|status|restart    # SysV init script location
# (2) systemctl + start|stop|status|restart
sudo systemctl start sshd.service
sudo service sshd start   # older command, still works on many systems

service --status-all  # list all services and their status


# 设置启动与自启动
chkconfig --level 2345 sshd on   # enable sshd to start at runlevels 2,3,4,5
chkconfig --level 2345 sshd off  # disable sshd from starting at run



-e 选项才能逐个删除各个位置的服务文件


源码包全部在这个位置，直接删除整个包目录即可，不会有任何残留文件

# (3) ============= 源码包自启动服务设置 ========================

#(1)可以管理独立服务和xinetd服务
/etc/rc.local  # 脚本文件，可以在这里添加自启动命令
# if add :
/etc/rc.d/init.d/httpd start  # 脚本文件，可以在这里添加自启动命令
# 这是最推荐的方式！！！！ 可以自启动一切服务


#(2)可以管理独立服务和xinetd服务
ntsysv on  # enable ntsysv text-based service manager
ntsysv off # disable ntsysv text-based service manager

=