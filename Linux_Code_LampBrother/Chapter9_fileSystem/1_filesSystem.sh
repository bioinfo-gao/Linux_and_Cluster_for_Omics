# 主分区最多4个
# 扩展分区也是主分区的一张，唯一作用是建立逻辑分区
/dev/sda1
/dev/sda2
/dev/sda4 # 第四个主分区或者扩展分区
/dev/sda5 # 第一个逻辑分区 
...
/dev/sda10 # 第一个逻辑分区 

# More common practice 
/dev/sda1
/dev/sda2 # 扩展分区
/dev/sda5 # 第一个逻辑分区 
...
/dev/sda8 # 第一个逻辑分区 
# 1234 只能给主分区或者扩展分区使用

# ======================================
# fileSystem
# ext2, ext3, ext4
# 分区的目的就是写入文件系统


# ======================================


# 显示分区
df -h

none            3.8G  4.0K  3.8G   1% /mnt/wsl
drivers         462G  399G   63G  87% /usr/lib/wsl/drivers
/dev/sde       1007G  3.4G  953G   1% /
none            3.8G   92K  3.8G   1% /mnt/wslg
none            3.8G     0  3.8G   0% /usr/lib/wsl/lib
rootfs          3.8G  2.7M  3.8G   1% /init
none            3.8G     0  3.8G   0% /dev
none            3.8G  4.0K  3.8G   1% /run
none            3.8G     0  3.8G   0% /run/lock
none            3.8G     0  3.8G   0% /run/shm
none            3.8G     0  3.8G   0% /run/user
none            3.8G   76K  3.8G   1% /mnt/wslg/versions.txt
none            3.8G   76K  3.8G   1% /mnt/wslg/doc
C:\             462G  399G   63G  87% /mnt/c

# 查看目录和子目录大小
du -sh /etc
-s 显示本机目录大写，不列子目录和子文件大写
-a 还显示子文件大写

df vs du 
# df 看文件系统，除了文件还需要考虑命令和程序占用的空间
# du 慢得多，因为是逐个扫描的高负载命令，只统计文件大小

df 看到的才是真实可用空间
很多硬盘空间 尽管没有被文件占用，但因为被大量程序和命令占用，也不开使用
临时文件没有释放

# 最好定期重启清除临时文件

# 文件系统修复命令
fsck  分区设备文件名

自动执行，最好不要手动执行

# 显示磁盘状态的命令
# dump  转储、导出
# e2    ext2 / ext3 / ext4指及其后续版本
# fs	filesystem	文件系统
# dumpe2fs 的字面意思是 “转储 ext2系列文件系统的信息”。

df -h
dumpe2fs /dev/sba1
dumpe2fs  /mnt/wslg/versions.txt
# hardware uniq ID
# block size
# inode 
# block number
# block size
# acl
