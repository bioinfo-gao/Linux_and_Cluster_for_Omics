man chattr
# chattr - change file attributes on a Linux file system
# 沈超翻译位系统文件属性
# 对root照样生效

chattr [+-=] [option] file/dir 
# + 增加权限
# - 减少权限
# = 等于某权限


# 权限在option 中定义
# 实际上 i 是修改的意思
# i， 如果对文件设置i属性，则该文件不允许删除，改名，不能添加数据，不能修改数据
# i， 如果对目录设置i属性，那么只能修改该目录下文件的数据，但不能建立文件，不能删除文件
# 也就是用户只能看，不能改

# 实际上 a 是追加的意思
# a， 如果对文件设置a属性，则该文件只能添加数据，不能修改数据删除数据
# a， 如果对目录设置a属性，那么只能在该目录下建立文件，修改文件，不能删除文件
# 也就是用户只能增加，不能改旧数据，不能删除旧数据

lsattr [] file/dir
# -a 显示所有文件和目录
# -d 若目标是目录，只显示目录本身的属性，不显示子文件属性

cd ~/Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter8_special_permisson
ll

touch abc
sudo chattr +i abc
lsattr abc
lsattr abc
# ----i---------e------- abc
# i added
# e means filesystem
echo 1111 >> abc

mkdir  abcD
sudo chattr +i abcD
lsattr -a abcD
lsattr -d abcD

sudo chattr -i abcD
cd ./abcD/
touch bcd
echo "ssss1" >> bcd

touch bcd1
touch abcD/bcd2
# 不允许添加 ：
# gao@ DESKTOP-C8OKE65  11:20 $ touch abcD/bcd2
# touch: setting times of 'abcD/bcd2': No such file or directory

# 文件只能  >> 的方式追加，vim 不可以，因为系统难以判断是不是修改了其他内容


# gao@ DESKTOP-C8OKE65  11:10 $ lsattr -a abcD
# ----i---------e------- abcD/.
# --------------e------- abcD/..
# ~/Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter8_special_permisson :  
# gao@ DESKTOP-C8OKE65  11:10 $ lsattr -d abcD
# ----i---------e------- abcD

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

# ======================================
# sGID也比较危险
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

# sGID 对目录不危险
# 对目录， 普通用户必须有r x 才能进入和查看 cd and ls
mkdir test
chmod 2755 test 
chmod g+s test 

ld test
gao@ DESKTOP-C8OKE65  01:18 $ ld test
drwxr-xr-x+ 2 gao gao 4096 Nov 25 21:17 project/
drwxr-sr-x  2 gao gao 4096 Nov 26 01:18 test
drwxr-sr-x  2 gao gao 4096 Nov 26 01:18 test/

# note the s

#  作用于目录意义不打
#　普通用户在此目录中新建的文件的有效组变为此目录的属主
-rw--rw-r--. 1 sc root  test/

# ======================================
# 前面两个sUID sGID 是扩权，粘着位是限权

# Sticky BIT 对目录
# sBIT 对目录， 
# 一般情况下普通用户必须有w x 才能创建删除和查看 cd and ls
# 如果没有黏着位，一个用户可能删除其他用户在这个目录的文件
# 设置了黏着位之后，只能删除自己的文件

ll -d /tmp
gao@ DESKTOP-C8OKE65  01:19 $ ll -d /tmp
drwxrwxrwt 8 root root 4096 Nov 25 22:18 /tmp

# note the t

# add sBIT
chmod 1755 dir 
chmod o+t dir 

# remove sBIT
chmod 0755 dir 
chmod o-t dir 

# 几乎不可能 7755， 理论上可以设立，但一定有某些功能没效果

