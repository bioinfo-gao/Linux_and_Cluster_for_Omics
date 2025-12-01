# (1) ============= sda  grub 安装引导 ========================
# 查看系统磁盘分区情况，确认引导安装位置
fdisk -l

/dev/sda1     hd0,0         # 假设引导安装在 /dev/sda1 分区

cat /boot/grub/grub.cfg  # grub 配置文件位置

/etc/default/grub # grub 默认配置文件位置
/etc/grub.d/  # grub 配置文件目录
/boot/grub/grub.cfg  # grub 主配置文件位置


# (2) ============= 安装 grub 引导 ========================
grub-install /dev/sda   # 在 /dev/sda 磁盘安装 grub 引导程序

default 0   # 设置默认启动项为第一个菜单项
timeout 5   # 设置启动菜单等待时间为5秒

splashimage=(hd0,0)/boot/grub/splash.xpm.gz  # 设置启动菜单背景图片位置

# (3) ============= 更新 grub 配置文件 ========================
update-grub   # 生成或更新 grub 配置文件 /boot/grub/grub