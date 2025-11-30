# (4) =====================================================
# xinetd 服务的启动与自启动设置 这个已经很小用了

# xinetd 管理其他服务，比如 telnet ftp 等等
# 安装xinetd服务管理器


Error: Unable to find a match: xinetd
sudo yum install xinetd  -y # 安装xinetd服务管理器 
/etc/xinetd.conf  # xinetd 主配置文件 
/etc/xinetd.d/telnet  # xinetd 主配置文件


sudo yum install telnet  -y # 

service telnet start  # 启动telnet服务

chkconfig --list   # 查看xinetd服务是否启用
# chkconfig --list xinetd   # 查看xinetd服务是否启用