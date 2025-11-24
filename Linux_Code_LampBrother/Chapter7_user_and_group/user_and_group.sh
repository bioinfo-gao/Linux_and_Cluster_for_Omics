/etc/passwd
/etc/shadow
/etc/group
/etc/gshadow

# man 1 passwd # cmd manuel
man 5 passwd # configure file manuel

vim /etc/passwd
cat /etc/passwd
# 7 section
# user_name, x for passwd, uid, gid, addtional info (not necessary), home directory default shell 
uid ==0  root
# A user belong to a primary group, and many addtional secondary groups if needed 

ll /etc/passwd # 权限644
ll /etc/shadow # 权限000 000 000， 和软连接 777 777 777 正好相反

# 9 section
# 1-3
# user_name, Encrypted string of password, last mofification of renewed password 
# 4-5
# the space between 2 continuous password changes,  effective time within last modification , e.g. 90
# 6-7
# notice time before expiration data , Grace Period after expiration (-1 means always effetive)
# 8-9
# 失效时间(只能用时间戳表示)， 不管有没有到期， 保留(未使用)

# Encrypted string of password  + ! or !!, stop the use from login
# Timestamp: the date start from 1970-01-01

# 时间戳换算成日期 
date -d "1970-01-01 20416 days"
date -d @1731792660 #秒

# Mon Nov 24 12:00:00 AM EST 2025 
# 日期换算成时间戳 
echo $(( $(date --date="2025/01/01" +%s ) /86400 +1 ))
# 20090

echo $(( $(date +%s) / 86400 )) # current date's time stamp 
# 20416

cat /etc/group
ll /etc/gshadow # 权限000 000 000， 和软连接 777 777 777 正好相反
sudo cat /etc/gshadow # 权限000 000 000， 和软连接 777 777 777 正好相反

# /etc/group 4 sections 
# 组名 , 组密码标志， GID ，组内附加用户
# 组管理员用户名?(组管理员还需要组密码进行管理)？
root:x:0:
adm:x:4:gao
gao:x:1000:
sgx:x:106:
zhen:x:1001:

# /etc/gshadow 4 sections 
# gid , 组密码标志， 组中附加用户， 
adm:::gao
tty:::
disk:::
lp:::
mem:::
kmem:::
wheel:::gao
cdrom:::gao