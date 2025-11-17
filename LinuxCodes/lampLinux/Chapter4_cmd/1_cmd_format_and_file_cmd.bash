#! /home/gao/bash 
# cmd [-option] [parameters]
ls -la /etc 
# option can be used together -al == -al = -l -a
# option has simplified and full format
-a == --all

ls -l -a -h -d -i
lla
ld # ls -ld */  -d 让 ls 本身列出目录条目（而不是目录内容） */ 是 shell 通配符，只匹配目录

# -rwxr--rw-
# u g o

mkdir ./tmp/
mkdir ./tmp/Japan/boduo
mkdir -r./tmp/Japan/boduo # mkdir recursively and touch a file 
mkdir ./tmp/Japan/longze  ./tmp/Japan/cangjing

mkdir -p ./tmp/tmp3_ZG/3rd_level_dir/f  && touch ./tmp/tmp3_ZG/3rd_level_dir/file.txt 
# cp -r tmp/tmp3_ZG/    tmp/tmp1_ZG/     # recursive 
llh ./tmp/tmp3_ZG/
ll ./tmp/tmp3_ZG/3rd_level_dir/file.txt

cd 
cd ..
cd ../..
cd /tmp/tmp3_ZG/
cd -

pwd


rmdir tmp # delete blank dir
rmdir tmp1

rm -r tmp/tmp1_ZG                          # -r  recursive 

mkdir  tmp/tmp1_ZG/3rd_level_dir_1/   
cp  -r  tmp/tmp1_ZG/3rd_level_dir/    tmp/tmp/3rd_level_dir_renamed # copy and rename
# -r keep file time etc
# -p keep timestamp

clear # Ctrl + l

# move and rename 
mv  tmp/tmp/3rd_level_dir_renamed   tmp/tmp1_ZG

cp -r tmp/tmp1_ZG     tmp/tmp2_ZG    
rm -rf tmp/tmp2_ZG    
# -f
# -r  

touch ./tmp/story.list
cd ./tmp
touch shencao girl
touch "shencao girl" # dot NOT use Space , troublesome 


cat /etc/issue
cat -n /etc/issue

cat /etc/services
tac /etc/services # reverse

more /etc/services # page arrow down  or space  a page , enter a line 
less /etc/services # page arrow down  or space 
# /keyword  search , n   next-match

head /etc/services # -n : n line 
tail -n 3 /etc/services #  

cp /etc/services  /home/gao/tmp/
ln -s /home/gao/tmp/services service_link
ln /home/gao/tmp/services service_hard


ls -i /home/gao/tmp/services 
ls -i service_link
ls -i service_hard
ls -il service_link
ls -il service_hard

echo "www.lampbrother.com" /home/gao/tmp/services service_hard

# difference between hardlink  and cp -p  , can keep updating
# hard ln cannot cross partion  不能跨分区，
# 硬连接不能对目录使用

