# (1) =============
# 正确日志记录信息
# 错误日志记录到指定文件
# 监控本机器状态并记录日志
# 通过日志查看分析问题
# 使用logrotate工具

# (2) =============
ps aux | grep rsyslog   # 查看rsyslog服务是否运行 
root       567   0.0  0.1  70432  5124 ?        Ss   17:55   0:00 /usr/sbin/rsyslogd -n 
gao       8846  0.0  0.0   6420  2176 pts/6    S+   17:56   0:00 grep --color=auto rsyslog

rsyslogd            # 启动rsyslog服务
systemctl status rsyslog   # 查看rsyslog服务状态
logger "This is a test log message"   # 记录一条测试日志
tail -f /var/log/messages   # 实时查看系统日志文件内容

/var/log/cron     # 记录cron作业的执行情况
/var/log/dmesg    # 记录内核环缓冲区的消息
/var/log/kern.log   # 记录内核相关的消息
/var/log/auth.log   # 记录与认证和授权相关的消息
/var/log/syslog   # 记录系统范围内的日志消息
/var/log/cups     # 记录CUPS打印服务的活动
/var/log/messages  # 实时查看系统日志文件内容
/var/log/btmp      # 记录失败的登录尝试x
/var/log/lastlog   # only accessed by last and lastlog 命令，显示所有用户的最后登录时间
/var/log/faillog   # 记录失败的登录尝试
/var/log/secure    # 记录与安全相关的消息，如认证和授权
/var/log/wtmp      # 记录所有登录和注销活动 last命令读取该文件
/var/log/utmp      # 记录当前登录的用户信息 who命令读取该文件
/var/log/maillog   # 记录邮件服务器的活动
/var/log/httpd/    # 记录Apache HTTP服务器的访问和错误日志
/var/log/nginx/    # 记录Nginx服务器的访问和错误日志
cat /var/log/yum.log   # 记录使用YUM包管理器安装、更新和删除软件包的活动    

# 源码包的log不在/var/log下，一般在源码包目录下的logs或log目录中


# (3) =============
vi /etc/logrotate.conf   # 编辑logrotate配置文件
cat /etc/logrotate.conf   # 查看logrotate配置文件内容
logrotate -d /etc/logrotate.conf   # 测试logrotate配置文件
logrotate /etc/logrotate.conf   # 执行logrotate进行日志轮转
# 定期轮转日志文件防止过大


# (4) =============