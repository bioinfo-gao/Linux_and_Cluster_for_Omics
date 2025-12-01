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
hiddenmenu   # 隐藏启动菜单

title Linux  # 启动菜单项名称
    root (hd0,0)   # 设置根分区, 即启动主目录位置
    kernel /boot/vmlinuz-... ro quiet  # 设置内核路径和启动参数
    initrd /boot/initrd-...  # 设置初始内存盘路径


装多系统是，应该先装Windows，再装Linux，因为Windows安装程序会覆盖MBR，引导Linux启动项会丢失
linux 可以识别 Windows 引导项，并将其添加到 grub 启动菜单中

生产服务器基本上不会装多系统，因为多系统会增加维护复杂度和安全风险
不管是Windows 还是Linux，生产服务器一般只装一个系统，确保系统稳定和安全运行

# (3) ============= 更新 grub 配置文件 ========================
update-grub   # 生成或更新 grub 配置文件 /boot/grub/grub

# (3) =============  grub 加密 ========================
grub 引导程序    可以通过设置密码来保护引导菜单，防止未经授权的用户修改启动选项或进入单用户模式
grub-mkpasswd-pbkdf2   # 生成 grub 密码散列值
# 输入密码后，生成类似如下的散列值  
# PBKDF2 hash of your password is grub.pbkdf2.sha512.10000.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# 在 /etc/grub.d/40_custom 文件中添加如下内容，设置 grub 密码保护
set superusers="root"
password_pbkdf2 root <generated_hash_value>



grub-md5-crypt   # 生成 grub md5 加密密码, 
grub-mkpasswd-pbkdf2 # SHA512 更安全，推荐使用 
# 手工输入密码后，生成类似如下的 md5 散列值
# $1$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# 在 /etc/grub.d/40_custom 文件中添加如下内容，设置 grub 密码保护
set superusers="root"
password_md5 root <generated_md5_hash_value> # 注意这里是 md5， 不是 pbkdf2
# 然后更新 grub 配置文件
update-grub