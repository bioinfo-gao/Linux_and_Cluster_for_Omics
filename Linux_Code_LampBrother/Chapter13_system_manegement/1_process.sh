# (1) ============= Processes基本概念 ========================
任何程序只要要运行就会占用一个或多个进程号（PID，Process IDentifier）
每个进程都有一个父进程（PPID，Parent Process IDentifier）
每个进程都有一个所属用户（UID，User IDentifier）
每个进程都有一个所属组（GID，Group IDentifier）

# (2) =============Processes管理命令
ps aux                # 查看所有用户的进程, UNIX风格
ps -ef                # 查看所有用户的进程, Linux风格
ps -le                # 查看所有用户的进程,Linux风格，显示更详细信息
ps aux | grep httpd   # 查看所有用户的httpd进程, UNIX风格
ps -aux | grep httpd  # - 并不出错，但会被忽略
ps -ef | grep httpd   # 查看所有用户的httpd进程, Linux风格
ps -le | grep httpd   # 查看所有用户的httpd进程,Linux风格，显示更详细信息
    tty                # 终端类型
    tty1-6             # 字符界面物理终端
    tty7               # 图形界面物理终端
    pts/0-n            # 伪终端 256个
    CMD                # 进程名称
    STAT               # 进程状态    
        R 运行中 (Running)
        S 睡眠中 (Sleeping)
        D 不可中断睡眠 (Disk sleep)
        T 停止 (Stopped)
        Z 僵尸进程 (Zombie)，正确中止会产生临时性的僵尸进程，如果始终存在说明父进程没有正确回收子进程
        S+ 前台进程 (Foreground process)
        Sl 多线程 (Multi-threaded)
        Sl+ 多线程前台进程 (Multi-threaded foreground process)
        + 高优先级 (High priority)
        Ss  会话首进程 (Session leader)
    TIME               # 进程使用的CPU时间总和

    VSZ                # 进程使用的虚拟内存大小 (Virtual Set Size)
    RSS                # 进程使用的物理内存大小 (Resident Set Size)

PID                   # 进程ID
/sbin/init            # init进程，所有进程的祖先进程，PID=1, PPID=0 计算机启动后第一个运行的进程
PPID                  # 父进程ID
UID                   # 进程所属用户ID
GID                   # 进程所属组ID
%CPU                  # 进程占用的CPU百分比

top                   # 实时查看系统进程状态, top 5 lines show most important system info

htop                  # 更友好的实时查看系统进程状态（需要安装htop包）
pstree                # 以树状图显示进程关系
kill PID             # 终止指定PID的进程
killall process_name  # 终止所有指定名称的进程

nice -n 10 command    # 以较低优先级运行命令
renice -n 5 -p PID    # 修改指定PID进程的优先级

只有正确中止不生效的时候才使用kill -9 PID 强制终止进程

# (3) =============后台运行进程 & 和 nohup
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
彻底关闭不必要的服务
彻底消灭恶意软件和病毒，不只是终止恶意进程
优化系统性能和响应速度

搭建监控服务器