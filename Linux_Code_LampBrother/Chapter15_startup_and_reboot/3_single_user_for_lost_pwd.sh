# (1) ============= sda  grub 安装引导 和设置密码========================
# 查看系统磁盘分区情况，确认引导安装位置
single user mode # 单用户模式下重置root密码
# 重启系统，在grub启动菜单按'e'编辑启动项
# 找到以'linux'或'linux16'开头的行，添加'single'或'rescue'到该行末尾
# 按Ctrl+x或F10启动进入单用户模式
# 系统进入单用户模式后，提示符为'#'
passwd  # 重置root密码，按提示输入新密码
# 如果提示文件系统为只读，执行以下命令重新挂载为读写
mount -o remount,rw /
passwd  # 再次执行passwd命令重置root密码
# 重置完成后，执行'reboot'命令重启系统，使用新密码
reboot

# (2) ============= 理论上光盘模式可以修复各种错误，包括grub密码丢失   ========================
用光盘启动U盘或光盘引导系统，进入救援模式
选择语言和键盘布局
选择“Rescue a Linux system”选项
选择要挂载的系统分区，通常是根分区
选择“Continue”继续
系统进入救援模式后，提示符为'#'
chroot /mnt/sysimage   # 切换到系统根目录

这个光盘模式，系统盘一般挂载在 /mnt/sysimage 下
passwd  # 重置root密码，按提示输入新密码
# 如果提示文件系统为只读，执行以下命令重新挂载为读写
mount -o remount,rw /mnt/sysimage
passwd  # 再次执行passwd命令重置root密码
# 重置完成后，执行'reboot'命令重启系统，使用新密码
reboot  

# (3) =============  ========================