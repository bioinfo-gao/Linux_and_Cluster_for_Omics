# fortmat  4 items
# 时间，主机名，服务名，信息
# Example:
# May 15 12:07:07 localhost sshd information

/etc/rsyslogd/rsyslog.conf   # rsyslog主配置文件位置

vim /etc/rsyslog.conf   # 编辑rsyslog配置文件
# 修改配置文件后需要重启rsyslog服务使配置生效
authpri.*          /var/log/secure  # 记录所有authpriv设施的日志到/var/log/secure文件
auth 
ftpriv.*          /var/log/auth.log  # 记录所有authpriv设施的日志到/var/log/auth.log文件

*  # all level
.  # 只要比后面的等级水平高，那么都记录
.= # 只记录等于后面等级水平的日志
.* # 记录所有等级水平的日志

# 服务名称：
authpriv    # 认证和授权相关日志
cron        # 定时任务相关日志
daemon      # 系统守护进程相关日志
kern        # 内核相关日志
lpr         # 打印服务相关日志
mail        # 邮件服务相关日志
syslog      # 系统范围内的日志
user        # 用户级别的日志
uucp        # UUCP服务相关日志
local0 - local7  # 本地使用的日志设施，可供自定义使用   

# 日志级别：
emerg       # 紧急情况，系统不可用,急诊室，需要立即处理，最高级别
alert       # 需要立即处理的问题
crit        # 严重情况
err         # 错误情况
warning     # 警告信息
notice      # 正常但重要的信息
info        # 一般信息
debug       # 调试信息，详细的调试输出  ，最低级别

## 日志记录示例：
authpriv.*      /var/log/secure  # 记录所有authpriv设施的日志
mail.*          /var/log/maillog  # 记录所有mail设施的日志到/var/log/maillog文件
cron.*          /var/log/cron     # 记录所有cron设施的日志到/var/log/cron文件
*.info          /var/log/messages  # 记录所有设施info
# speciallly, emergency级别的日志发送到所有用户终端
*.emerg         *  # 记录所有设施emergency级别的日志到所有, *表示所有用户终端



# 日志记录位置：
/var/log/secure    # 认证和授权相关日志
/var/log/auth.log  # 认证和授权相关日志
/var/log/cron      # 定时任务相关日志
/var/log/maillog   # 邮件服务相关日志
/var/log/messages  # 系统范围内的日志
/var/log/syslog    # 系统范围内的日志
/var/log/kern.log  # 内核相关日志
/var/log/daemon.log # 系统守护进程相关日志
/var/log/user.log  # 用户级别的日志
/var/log/lpr.log   # 打印服务相关日志

系统设备文件 /dev/log  # rsyslog默认监听的UNIX域套接字，用于接收本地系统日志消息
UDP端口514         # rsyslog默认监听的UDP端口，用于接收远程日志消息
TCP端口514         # rsyslog可配置为监听的TCP端口，用于接收远程日志消息

# 发送信息 to all users
*.emerg         *

# logrotate 配置文件位置：
/etc/logrotate.conf        # 主配置文件
/etc/logrotate.d/          # 目录，包含各个服务的logrotate配置文件  
# logrotate 常用命令：
logrotate -d /etc/logrotate.conf   # 测试logrotate配置文件
logrotate /etc/logrotate.conf      # 执行logrotate进行日志轮转  
# -d 选项用于调试模式，不会实际执行轮转操作，只显示将要执行的操作
# logrotate 配置示例：
/var/log/messages {
    weekly                  # 每周轮转日志文件
    rotate 4                # 保留4个轮转的日志文件
    compress                # 轮转的日志文件进行压缩
    missingok               # 如果日志文件不存在，不报错继续
    notifempty              # 如果日志文件为空，不进行轮转
    create 640 root adm     # 创建新的日志文件，设置权限和所有者
    sharedscripts           # 在轮转前后只执行一次脚本
    postrotate
        /usr/bin/killall -HUP rsyslogd   # 轮转后重启rsyslog服务
    endscript
    dateext                # 轮转的日志文件添加日期后缀 << =================== 
    # 如果不加dateext选项，轮转的日志文件会以数字后缀命名，如messages.1, messages.2等
    # 加上dateext选项后，轮转的日志文件会以日期后缀命名，如messages-20240615, messages-20240622等
    # dateformat -%Y%m%d    # 自定义日期格式为-YYYYMMDD
    # 没有dateext选项时，默认格式为.suffix，其中suffix是一个递增的数字, 文件每天会更名为 messages.1, messages.2 等
    # 有了dateext选项后，默认格式为-YYYYMMDD, 文件每天会更名为 messages-20240615, messages-20240616 等，更直观，
    # 且文件不需要每天更改文件名，便于管理和查找
}   
# 以上配置表示每周轮转/var/log/messages日志文件，保留4个轮转文件，进行压缩，并在轮转后重启rsyslog服务


# rpm 安装的包，一般会在 /etc/logrotate.d/ 目录下生成对应的logrotate配置文件， 无需手动配置，可以手动查看和修改
# 只有源码包才需要自己配置logrotate，二进制包安装的软件一般会自动配置好logrotate

# vim /etc/logrotate.d/rsyslog   # 查看rsyslog的logrotate配置文件
# 这个文件应该已经存在，无需手动创建，包括其他备份设置
# 添加如下内容，以轮转Apache日志文件为例：

/usr/local/apache2/logs/access_log {
    daily
    create 
    rotate 30
    dateext
}

# (5) =============
# logrotate 定时任务配置文件位置：
/etc/cron.daily/logrotate   # 每天执行logrotate
/etc/cron.weekly/logrotate  # 每周执行logrotate
/etc/cron.monthly/logrotate # 每月执行logrotate
# logrotate通常通过cron定时任务自动执行，无需手动配置
# 可以根据需要修改对应的cron定时任务脚本，以调整logrotate的执行

logrotate -v /etc/logrotate.conf   # 手动执行logrotate进行日志轮转
# -v 选项用于显示详细的轮转过程信息
# 手动执行logrotate时，建议加上-v选项，以便查看轮转过程和结果
# -f 强制轮转日志文件，即使不满足轮转条件也会执行轮转操作


cpio 主要做两件事：
打包 (Copy-Out)：从标准输入 (stdin) 读取一个文件列表，然后把这些文件打包成一个单一的、连续的归档文件（archive file），并输出到标准输出 (stdout)。
解包 (Copy-In)：从标准输入 (stdin) 读取一个归档文件，然后根据归档中的内容在当前目录下恢复（解包）出原始的文件和目录。

1. Copy-Out 模式 (-o 或 --create)
作用：创建归档文件（打包）。
工作流程：[生成文件列表的命令] | cpio -o > archive_name.cpio
经典示例：
假设你想把当前目录下的所有 .txt 文件打包。


# 1. 使用 find 命令来生成文件列表
#    find . -name "*.txt"  会找出所有 .txt 文件并打印它们的路径

# 2. 通过管道 | 将这个列表喂给 cpio -o
# 3. 使用 > 将 cpio 输出的归档内容重定向到一个文件里
find . -name "*.txt" | cpio -o > text_files.cpio




2. Copy-In 模式 (-i 或 --extract)
作用：提取归档文件（解包）。
工作流程：cpio -i < archive_name.cpio
经典示例：
你想解开刚才创建的 text_files.cpio 归档。




# 1. 使用 < 从文件中读取归档内容，并将其作为 cpio 的标准输入
# 2. cpio -i 会读取这个输入流并解包
cpio -i < text_files.cpio

3. Pass-Through 模式 (-p 或 --pass-through)
作用：不创建归档文件，而是直接将文件从一个目录复制到另一个目录。
工作流程：[生成文件列表的命令] | cpio -p /path/to/destination_directory
经典示例：
你想把 /home/user/source_dir 目录下的所有内容，原封不动地复制到 /mnt/backup/ 目录下，并保持所有文件属性（如权限、时间戳）。


# 1. 先进入源目录
cd /home/user/source_dir

# 2. 使用 find . -print 来生成当前目录下所有文件的列表
# 3. 将列表喂给 cpio -p，并告诉它目标目录是 /mnt/backup/
#    -d 选项在这里也很有用，确保目标目录如果不存在会被创建
find . -print | cpio -pd /mnt/backup/


cpio 现在还用在什么地方？
虽然在日常的手动打包/解包任务中，tar 因为其更简洁的语法而更受欢迎，但 cpio 在一些特定的系统级任务中仍然扮演着不可或-缺的角色。
RPM 包管理：Linux 的 RPM 包（红帽系发行版如 CentOS, Fedora, Oracle Linux 使用）的内部文件就是用 cpio 格式压缩的。当你安装一个 RPM 包时，系统底层实际上就是在用 cpio 来解包。你可以用 rpm2cpio 命令来手动提取 RPM 包的内容。
code
Bash
rpm2cpio my_package.rpm | cpio -idv