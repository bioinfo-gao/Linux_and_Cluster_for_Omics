write  # to online user

wall  minge is the honest man # to all online user 

sudo ping -c 3 192.168.1.171 # never stop 


ifconfig  # check and set ip address 

mail root 

# Important log cmd 
last     # all user login time and computer reboot time 
lastlog  # all user 
lastlog  -u 501 # all user 

traceroute www.google.com

netstat -tlun # 查看本地监听的端口 -t tcp  -u udp  间接判断本地有哪些服务
netstat -an   # 查看本机所有的网络连接  -a all 
netstat -rn   # 查看本机路由表 网关是 Gateway 

netstat -an | grep ESTAB*  # 正在连接的程序

setup # redhat setup address 

service network restart # 重启网络服务

mkdir /mnt/cdrom 
mount /dev/sro /mnt/cdrom 
mount -t iso9660 /dev/sro /mnt/cdrom

umount 

ll  /dev/cdrom