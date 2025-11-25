# home direcotry
/home/user_name/
# default permission 700

/root
# default permission 550

# mail 
/var/spool/mail/user_name/

# skel file 创建新用户的模版位置，可在此添加文件，则新用户自动copy此文件
/etc/skel

# 两个添加新用户的默认设置
/etc/default/useradd
# Inactive=-1
# Expire=
# SHELL=/bin/bash
# SKEL=/etc/skel
# CREATE_MAIL_SPOOL=yes
/etc/login.defs
# PASS_MAX_DAYS=99999, 180
# PASS_WARN_AGE=7
# ENCRYPT_METHOD SHA512


useradd user_name

passwd  user_name 
# -S check information
# -l lock user + !! two !!
# -u unlock user + remove the two !!
# --stdin accept the string from pipe

# reference  
# ~Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter11_shell_programming/9_for_loop/8_add_user_batch.sh

# 修改已存在用户
# change user information, such as -G, -u, -c, -L, -U
usermod 
# -L add !, one !
# -U remove the "!"

# 修改用户状态
chage
# -d 密码的最后一次修改时间
# -M 密码有效期

chage  -d 0 lamp
# 这个用户的修改日期归0
# 一登录就要修改密码

usrdel -r user_name 
# -r 同时删除家目录， 一般情况下必须

# 实际上就是修改或者删除6个文件
 
# modify 4 files 
/etc/passwd
/etc/shadow
/etc/group
/etc/gshadow

# delete 2 folder
/var/spool/mail/user_name
/home/user_name

# 查询uid  gid
id user_name


# 切换用户身份, switch user
su user_name
su - root 
# - , 更重要
# - 连带环境一起切换, 一般需要

su - root -c "useradd bao"
# -c 只执行一条命令， 类似sudo


# 切换成root暂时执行一条命令
sudo