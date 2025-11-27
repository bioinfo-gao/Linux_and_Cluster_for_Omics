# 主分区最多4个
# 扩展分区也是主分区的一张，唯一作用是建立逻辑分区

# 查询
mount 

mount -l # 显示卷标

# 依赖 /etc/fstab 重新挂载, -a all
mount -a



# mount but NO exec / whole partition
# mount -o remount, noexec /home/ 
#  noexec vs exec 



# 把设备文件名和挂载点连接起来
# 光盘
mount -t iso9660 /dev/cdrom /mnt/cdrom
mount  /dev/cdrom /mnt/cdrom
mount  /dev/sr0 /mnt/cdrom

# remove cdrom ， 设备文件名和挂载点均可
umount  /dev/sr0 
umount /mnt/cdrom

#cdrom is soft link of sr0



# U盘
# 查询设备文件名
fdisk -l

Disk sdb
sdb1

mkdir /mnt/usb

mount  -t vfat /dev/sdb1 /mnt/usb

umount  /dev/sdb1 

# mount NTFS
mount  -t ntfs-3g /dev/sdb1 /mnt/usb

#umount
umount  /dev/sdb1 