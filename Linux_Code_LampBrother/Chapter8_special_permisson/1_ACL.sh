# What are ACLs (Access Control Lists)?
#核心是学习Windows， 给每个文件夹和文件分配权限

# 查看分区是不是支持acl权限

df -h


df . # 该路径所属的文件系统（也就是分区）
# Filesystem      1K-blocks    Used Available Use% Mounted on
# /dev/sdd       1055762868 3555600 998503796   1% /

stat .
stat -f .


# dumpe2fs  -h /dev/sda1
sudo dumpe2fs  -h /dev/sdd
# Default mount options:    user_xattr acl
# user_xattr acl  支持

# 重新挂载根分区并加入acl 权限
mount -o remount,acl /

# 该文件极其重要！ 小心修改
# 必须修改  /etc/fstab 永久生效, 修改配置文件之后需要重启或者重新挂载
sudo vim  /etc/fstab 
mount -o remount /

cd cd Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter8_special_permisson/
touch myfile.txt

# 1. getfacl: Viewing ACLs
getfacl myfile.txt
# file: myfile.txt
# owner: alice
# group: developers
user::rw-
group::r--
other::r--


# 2. setfacl: set ACLs
# set a specific entry
setfacl -m g:marketing:r-x /projects/collaboration/

# Remove a specific entry 
setfacl -x u:bob /projects/collaboration/

setfacl -m u:zhen:r-x myfile.txt
#setfacl -m u:zhen:w-x myfile.txt

ll .
# -rw-r--r--  1 gao gao 1158 Nov 24 21:46 1_ACL.sh
# -rw-rwxr--+ 1 gao gao    0 Nov 24 21:21 myfile.txt

# 注意上一行的 "+"     myfile.txt
getfacl  myfile.txt
# file: myfile.txt
# owner: gao
# group: gao

# user::rw-
# user:zhen:-wx
# group::r--
# mask::rwx
# other::r--

sudo groupadd group2

setfacl -m g:group2:r-x myfile.txt

ll
-rw-r--r--  1 gao gao 1534 Nov 24 21:51 1_ACL.sh
-rw-rwxr--+ 1 gao gao    0 Nov 24 21:21 myfile.txt

getfacl myfile.txt

# file: myfile.txt
# owner: gao
# group: gao
user::rw-
user:zhen:-wx
group::r--
group:group2:r-x
mask::rwx 
other::r--

# mask 最大有效权限
# 赋予用户的权限必须和mask 相与才是真正授予权限
# 通常mask 给予最大权限，比如上面是rwx

cd ~/Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter8_special_permisson
mkdir project
# set Mask permission, m mask
setfacl -m m:rx ./project/
getfacl  ./project/

# file: project/
# owner: gao
# group: gao
user::rwx
group::r-x
mask::r-x
other::r-x

# 删除权限
setfacl -b file # del all permission of this file

setfacl -x g:group2:rx ./project
setfacl -x u:gggg2/rwx ./project

# 递归ACL 权限
#给父目录设置ACL权限是，所有子文件和子目录自动用相同权限
# -R
setfacl -m g:group2:rwx -R ./project/
# -R must be this position

# 递归对一切已有文件和文件夹有效但对新产生的文件不知道
# 所以设立默认ACL 权限，对一切新旧文件均有效
# d,  可以于 -R 联合使用

setfacl -m d:u:gggg33:rw  file

gao@ DESKTOP-C8OKE65  21:18 $ ll
total 12
-rw-r--r--  1 gao gao 2709 Nov 25 22:04 1_ACL.sh
-rw-r--r--  1 gao gao  587 Nov 25 21:12 3_sudo.sh
-rw-rwxr--+ 1 gao gao    0 Nov 24 21:21 myfile.txt
drwxr-xr-x+ 2 gao gao 4096 Nov 25 21:17 project
# + ACL permission