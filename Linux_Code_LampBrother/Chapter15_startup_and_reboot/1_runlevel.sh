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
/etc/rc.d/rc # 传统SysVinit系统中的运行级别脚本目录
/etc/rc.d/rc0.d/  # 运行级别0的脚本目录（关机）
/etc/rc.d/rc1.d/  # 运行级别1的脚本目录（单用户模式）
/etc/rc.d/rc2.d/  # 运行级别2的脚本目录（多用户模式，无网络）
/etc/rc.d/rc3.d/  # 运行级别3的脚本目录（多用户模式，有网络，无图形界面）
/etc/rc.d/rc4.d/  # 运行级别4的脚本目录（用户自定义）
/etc/rc.d/rc5.d/  # 运行级别5的脚本目录（多用户模式，有网络，有图形界面）
/etc/rc.d/rc6.d/  # 运行级别6的脚本目录（重启）
# 这些目录中包含启动和停止服务的脚本，脚本名称以S开头表示启动服务，以K开头表示停止服务
# 例如，/etc/rc.d/rc3.d/S20network表示在运行级别3启动网络服务
# 使用chkconfig命令管理SysVinit系统中的服务
chkconfig --list    # 列出所有服务及其运行级别设置
chkconfig service_name on   # 启用服务在所有运行级别启动
chkconfig service_name off  # 禁用服务在所有运行级别启动


在这7个运行级别脚本目录中，放置对应运行级别下需要启动或停止的服务脚本
以K开头的脚本用于停止服务， e.g., K20network表示在停止时优先级为20的网络服务脚本
以S开头的脚本用于启动服务, e.g,. S15httpd表示在启动时优先级为15的HTTP服务脚本  
数字部分表示启动或停止的顺序，数字越小，优先级越高
例如，S20network表示在启动时优先级为20的网络服务脚本,
会在优先级更高的脚本（如S15httpd）之后启动

K20network表示在停止时优先级为20的网络服务脚本,
会在优先级更低的脚本（如K25httpd）之前停止      

所有以K开头的脚本会在系统切换到该运行级别时执行，以停止对应的服务
所有以S开头的脚本会在系统切换到该运行级别时
执行，以启动对应的服务

所有这些脚本实际上是指向/etc/init.d/目录下对应服务脚本的符号链接
例如，/etc/rc.d/rc3.d/S20network实际上是指向/etc/init.d/network的符号链接 
(快捷方式)，便于管理和维护服务脚本


/etc/rc.d.rc.local  # 本地自定义启动脚本文件
# 可以在该文件中添加自定义的启动命令，这些命令会在系统启动时执行
# 例如，可以在该文件中添加启动自定义服务的命令
# 注意：在现代systemd系统中，rc.local文件可能不存在或不被使用，
# 需要手动创建并赋予可执行权限，或者使用systemd服务

启动各种服务和进程
挂载文件系统
设置网络配置
启动定时任务服务
执行自定义脚本和命令



# (3) =============
# (4) =============