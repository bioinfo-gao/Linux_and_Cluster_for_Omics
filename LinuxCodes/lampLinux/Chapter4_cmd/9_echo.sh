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


sudo shutdown -r now # no shutdown allowed for server           -h for shutdown
sudo shutdown -c # cancel the shutdown



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


