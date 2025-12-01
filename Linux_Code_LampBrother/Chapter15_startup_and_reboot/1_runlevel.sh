# (1) ============= run level
# runlevel命令用于显示或设置系统的运行级别
runlevel     # 显示当前和上一个运行级别
    N 5      # 当前运行级别为5，上一个运行级别未知, N表示未知,通常是系统刚启动时显示
    5 3      # 当前运行级别为3，上一个运行级别5

0 # 关机
1 # 单用户模式
2 # 多用户模式，无网络
3 # 多用户模式，有网络，无图形界面
4 # 系统未定义，用户可自定义
5 # 多用户模式，有网络，有图形界面
6 # 重启
systemctl get-default    # 查看默认的运行级别（target）
    graphical.target     # 图形界面模式，等同于runlevel 5
    multi-user.target    # 多用户模式，等同于runlevel 3
systemctl set-default multi-user.target   # 设置默认运行级别为多用户模式（runlevel 3）
systemctl set-default graphical.target    # 设置默认运行级别为图形界面模式（runlevel 5）
systemctl isolate multi-user.target      # 切换到多用户模式（runlevel 3）
systemctl isolate graphical.target       # 切换到图形界面模式（runlevel 5）
# systemctl isolate命令用于切换当前运行级别，而不改变默认运行级别   


init 0               # 关闭系统
init 6               # 重启系统
init 3               # 切换到多用户模式（runlevel 3）
init 5               # 切换到图形界面模式（runlevel 5

vim /etc/inittab   # 查看和编辑inittab文件（仅适用于SysVinit系统）
# 系统启动时会读取inittab文件以确定默认运行级别
# 在inittab文件中，可以设置默认运行级别，例如：
id:5:initdefault:   # 设置默认运行级别为5（图形界面模式）
# 注意：现代Linux系统通常使用systemd作为初始化系统，inittab文件可能不存在或不被使用


# (2) =============
# (3) =============
# (4) =============