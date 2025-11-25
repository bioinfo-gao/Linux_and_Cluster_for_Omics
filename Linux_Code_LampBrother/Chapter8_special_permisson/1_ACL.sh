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