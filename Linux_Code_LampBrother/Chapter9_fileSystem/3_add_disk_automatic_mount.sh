# add new disk 


# 查询
fdisk -l


# partition + disk
fdisk /dev/sdb 
# NOT sdb, befrore partion, only disck , NOT partition 
# l 选项  文件类型　 82是 sawp，　83 Linux 分区， 5 Linux 扩展分区， 逻辑分区也是83

# 强制重新读取分区表
partprobe


# 格式化分区， 扩展分区不能格式化，只能格式化普通分区和逻辑分区，因为这些分区可以写入文件系统
# 而扩展分区唯一的作用就是分逻辑分区
mkfs -t ext4 /dev/sdb1


# mount 
mount /dev/sdb1 /desk1
mount /dev/sdb5 /desk5

# check if partitions are corrected mounted , choose 1 of the 2
mount
df

# ==================
# 分区自动挂载，依赖配置文件 
/etc/fstab

dumpe2fs /dev/sdb1

5 个部分
设备文件名 (or UUID :硬盘唯一识别码)   挂载点   文件系统 挂载权限  是不是dump备份  是否fsck扫描以及优先级

# 设备文件名 (or UUID :硬盘唯一识别码)   /dev/sdb1
# 挂载点                                /disk1
# 文件系统                              /ext4   
# 挂载权限                              default
# 是不是dump备份                        0, 1, 2 
# 是否fsck扫描以及优先级                 0, 1, 2

# 对根分区重新挂载，并且加上读写权限
mount -0 remount, rw / # 


# ==================
# memory swap  space check 

free -m 

# cache   for read 
# buffer  for write
# gao@ DESKTOP-C8OKE65  17:53 $ free -m
#                total        used        free      shared  buff/cache   available
# Mem:            7615        1594        5902           3         312        6020
# Swap:           2048           0        2048

# add more swap

fdisk /dev/sdb

# 82 for swap
# change sdb6 to 82

# read fstab to active new swap  
partprobe 

# formatting swap
mkswap /dev/sdb6

# add the new swap to Whole samp
swapon /dev/sdb6

# remove the new swap to Whole samp
swapoff /dev/sdb6

# modify the /etc/fstab

/dev/sdb6 swap swap default  0 0 #不需要备份，不需要扫描