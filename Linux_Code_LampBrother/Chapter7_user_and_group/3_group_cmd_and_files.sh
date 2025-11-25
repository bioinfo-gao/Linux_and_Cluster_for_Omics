groupadd new_group

# 修改组名
groupmod  -n new_group lamp

# del a group
groupdel  lamp

# 只能删除附加组，初始组不能删除，除非删除初始用户
# cannot remove the primary group of user "lamp"


useradd -G , 添加新用户时候，把该用户加入某附加组

gpasswd  [-a gao] group_name
# -a user_name 把现有用户加入附加组
# -d user_name 把用户从改组删除

sudo gpasswd -a gao root
sudo gpasswd -a zhen root

head /etc/group 
# root:x:0:gao # 其实这种方法更简单更推荐