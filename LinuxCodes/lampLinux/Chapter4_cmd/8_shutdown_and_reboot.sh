# 服务器禁止关机只能重启，
# 关机之前要关闭服务
# shutdown 关机之前会合理保存文件
shutdown -h now # shutdown now 
shutdown -r now # reboot now # 20:30:30
shutdown -c # cancel


halt
poweroff # Most dangerous
init 0

=== reboot
reboot
init 6

cat /etc/inittab # already depreciated!
runlevel
N 3      # N : ealier level, N means from reboot 

0 关机                                  halt
1 单引号                                Single user mode
2 不完全多用户，不含NFS服务（网络文件系统）Multiuser, without NFS
3 完全多用户   Full multiuser mode                           
4 未分配    unused 
5 图形界面  x11
6 重启      reboot(No NOT set initdefault to this)

X  X11,  X86,  X window X free86

upcase X all means GUI

id:3:initdefault  # 修改默认运行级别

# Importang!! for system administrator
logout