# 危险的 sUID
# 只有可以执行的二进制程序才能设立 SUID 权限
# 执行者要有执行权限
# SetGID 权限只有在执行过程中有效，获得文件属主的身份
# SetGID


whereis passwd

ll /usr/bin/passwd
-rwsr-xr-x 1 root root 32648 Jan  9  2022 /usr/bin/passwd

# 普通用户修改自己密码也必须把结果写入shadow
ll /etc/shadow
---------- 1 root root 10890 Nov 24 00:54 /etc/shadow


passwd 用户自己
# u: sUID   
# g: sGID  
# o: sBIT  

# 添加 sGID
# 4 代表sUID  
chmod  4755 cmd
chmod  u+s cmd

# 2 代表sGID  
chmod  2755 cmd
chmod  g+s cmd

# 7 代表 all   
chmod  1755 cmd
chmod  g+s cmd

# 取消 sUID
chmod  u-s cmd 

chmod 4755 /usr/bin/vim #!!! extremely dangerous
chmod: changing permissions of '/usr/bin/vim': Operation not permitted

chmod u+s myfile.txt
-rwSrwxr--+ 1 gao gao    0 Nov 24 21:21 myfile.txt
# Upcase S, it's ERROR 
# user don't have x, such S means error

# 一般情况下，sUID应该严格控制
#　有sUID的cmd 应该定期扫描，防止病毒和入侵和错误


# 可以执行的二进制程序和目录可设立 SGID 权限
# 执行者要有执行权限
# SetGID 权限只有在执行过程中有效，获得文件属组的身份
# SetGID

# cmd 主要就是一个
locate

sudo ls -l /usr/bin/locate
-rwx--s--x 1 root slocate 41032 Jan  9  2022 /usr/bin/locate
# s in group

sudo ls -l /var/lib/mlocate/mlocate.db
-rw-r----- 1 root slocate 685291 Nov 17 16:04 /var/lib/mlocate/mlocate.db
# 普通用户理论上无权限，但升级为slocate组

