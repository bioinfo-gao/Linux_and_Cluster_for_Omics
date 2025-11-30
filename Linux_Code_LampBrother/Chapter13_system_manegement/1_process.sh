# (1) =============
任何程序只要要运行就会占用一个或多个进程号（PID，Process IDentifier）
每个进程都有一个父进程（PPID，Parent Process IDentifier）
每个进程都有一个所属用户（UID，User IDentifier）
每个进程都有一个所属组（GID，Group IDentifier）

# (2) =============
Processes管理命令
ps aux | grep httpd   # 查看所有用户的httpd进程
top                   # 实时查看系统进程状态
htop                  # 更友好的实时查看系统进程状态（需要安装htop包）
pstree                # 以树状图显示进程关系
kill PID             # 终止指定PID的进程
killall process_name  # 终止所有指定名称的进程
nice -n 10 command    # 以较低优先级运行命令
renice -n 5 -p PID    # 修改指定PID进程的优先级

# (3) =============
后台运行进程 & 和 nohup
command &             # 在后台运行命令
nohup command &       # 即使退出终端也继续运行命令
jobs                  # 查看当前用户的后台任务
fg %1                 # 将后台任务1带到前台
bg %1                 # 将任务1继续在后台运行   
bg  %2                 # 将任务2继续在后台运行
fg %2                 # 将任务2带到前台

# (4) ============= 进程管理的目的 ========================
# 进程管理的目的
查看服务器健康状态
查看服务器负载
查看系统中所有进程
查看当前用户的后台任务
释放系统资源
终止无响应进程
调整进程优先级
监控系统性能
确保关键服务运行