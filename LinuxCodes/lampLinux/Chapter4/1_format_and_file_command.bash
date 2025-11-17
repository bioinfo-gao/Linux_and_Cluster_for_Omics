#! /home/gao/bash 
# cmd [-option] [parameters]
ls -la /etc 

# option can be used together -al == -al = -l -a
# option has simplified and full format
-a == --all

ll -a
lla
ld

# mkdir recursively and touch a file 
mkdir -p ./tmp/tmp3_ZG/3rd_level_dir/f  && touch ./tmp/tmp3_ZG/3rd_level_dir/file.txt 

 
llh ./tmp/tmp3_ZG/
ll ./tmp/tmp3_ZG/3rd_level_dir/file.txt
cp -r tmp/tmp3_ZG/    tmp/tmp1_ZG/

#cp -p tmp/tmp1_ZG/3rd_level_dir/    tmp/tmp1_ZG/3rd_level_dir_copy/ # keep file time etc

rmdir tmp # delete blank dir
rmdir tmp1

rm -r tmp/tmp1_ZG

cd ..
cd

ln -s /home/gao/tmp/services service_link
ln /home/gao/tmp/services service_hard
ls -i /home/gao/tmp/services 
ls -i  service_hard


#sudo apt install plocate
locate service

find /etc/ -name init
find /etc -iname init
find /etc -name *init*
find /etc -name *init* -a -type f -exec ls -l {} \; # must keep the space "{} \;""
find /etc -name *init* -a -type f -ok ls -l {}\;
find /etc -name init??
find /etc -name inittab 
find /etc -user shenchao -ok rm  {} \; ##
find . -inum 19275595   -exec rm  {} \; ## no space
pwd


find /etc -size +10f # 100 block, 4096 in this linux 
find /etc -size +100  -a -size -2000 # larger than 100 block and less 2000 block  -o or
find /etc -user gao # 100 block, 4096 in this linux 
find /etc -cmin 5 # amin access time, cmin chanes 文件属性, mmin modification 
find /etc -cmin 5 # amin access time, cmin chanes 文件属性, mmin modification 

sudo tune2fs -l /dev/sda1 | grep -i 'block size'
#Block size:               1024

lsblk -o NAME,PHY-SeC # chek th block size 4096

touch --help
man find     # command 
man services # configure file 
man passwd # configure file 
whereis passwd
whatis passwd
man 1 passwd # configure file 
man 5 passwd # configure file 
apropos passwd 

w
who

date
man date 
info date

data --help # BASH buildin command 
which cd # No path are buildin command 
which umask
whereis umask
cd --help
umask --help
help umask 
help cd

cd --help
clear 

which ls

cd tmp
ll
cat file.txt
less /etc/inittab

grep world file.txt
grep -i world file.txt

ll /home/gao/tmp/services 
ll service_link
ll

cd 
 
cp -r tmp1_ZG/ tmp3_ZG/
cp services  services2


gzip services2
gzip tmp2_ZG 
gzip   tmp2_ZG.tar tmp2_ZG # Only for FIles

tar -cvf tmp2_ZG.tar tmp2_ZG # creat tar 

mkdir tmp2_ZG

#=== workfor Both dir And file , Both WINdows And Linux
zip tmp2_ZG.zip tmp2_ZG 
unzip tmp2_ZG.zip  


# keep the orinigal file with -k 
bzip2 -k testfile  # 
bzip2 tmp2_ZG  # bzip2: Input file tmp2_ZG is a directory.
bunzip2 tmp2_ZG.bz2  # bzip2: Input file tmp2_ZG is a directory. -k keep the bz2 file

tar -cvf tmp2_ZG.tar tmp2_ZG # creat tar 
gzip   tmp2_ZG.tar
tar -zcf tmp3_ZG.tar.gz tmp3_ZG  # create tar and make gz
tar -zxf tmp3_ZG.tar.gz 

tar -jcf tmp3_ZG.tar.gz tmp3_ZG  # create tar and make gz
tar -jxf tmp3_ZG.tar.gz  # open the tar

sudo shutdown -r now # no shutdown allowed for server           -h for shutdown
sudo shutdown -c # cancel the shutdown

# halt
# poweroff
# init 0

# === reboot
# reboot
# init 6

# cat /etc/inittab # already depreciated!
runlevel

logout # 

alias
# find the eaact configure for alias
PS4='+$BASH_SOURCE> ' BASH_XTRACEFD=7 bash -xl 7> /tmp/mylog
grep "alias " /tmp/mylog | grep -e /home -e /etc

whereis ls
whereis cd #system builtin command
Ctrl A #to the begininng to command
Ctrl E #to the end to command
Ctrl U # del back to the begining and copy the sentence
Ctrl K # del to the end and copy the sentence
Ctrl Y # paste the content from Ctrl U
Ctrl Z # to background

ls >> Correct_Info_Only 2>>Error_Info_Only 
ddadaddd >> Correct_Info_Only 2>>Error_Info_Only 
cat Correct_Info_Only  
cat Error_Info_Only 


lsd &>> /dev/null  # combine  correct and error together
psd >> error_and_message.txt 2>&1  # add error to coccect message then put the mssage to file

wc < error_and_message.txt 
# wc << dada 
#  xdsssdadadda 

# dada # command input another dada (same string in the 1st line to do wc)
 
ls ; date ; cd /user ; pwd # no logic relation at all

date ; dd if=/dev/zero of=~/testfile bs=1k count=100000; date

ll && echo yes
lldada || echo no
ll && echo yes !! echo no

lls && echo yes !! echo no

history | less | tail # pipe

grep "root"  /etc/passwd # -i -v -n

netstat -an | grep ESTAB* 
sudo apt install net-toolsgao

echo "the current time is :" `date`
name=gz
echo '$name'
echo "$name"
echo $name
echo `date`
current_time=`date`    # a command
current_time=$(date)   # same as `` but is recommneded as `` is hard to distiguish from ''
echo $current_time
echo $(date)
name2=$(date) # name2=`date`

echo $name2
ll

name3=${name2}25896
name3="$name2"123564

echo $name3

set
export name=tmp1_ZG
echo $name
pstree

set | grep name
env # all env variable

echo $?
echo $$
echo $!

# method 1
aa=11
bb=22
declare -i cc=$aa+$bb
echo $cc

# method2
dd=$(expr $aa + $bb) # blank arround "+" needed
echo $dd

# method3
ff=$[ $aa+$bb ] 
echo $ff

# method4
gg=$(( $aa+$bb )) 
echo $gg

# mutiple 
qq=$[ (11+3)*3/2 ] 
echo $qq

qq=$[ (11+3)%3 ] 
echo $qq

qq=$[ 1 && 0 ] # logical and 
echo $qq

qq=$(( 1 || 0 ))  # logical and 
echo $qq

# the PATH don't knkow the raw location I added to ~/.bashrc as a lot of people

