cd  # home dir
vim .bashrc
source .bashrc
which bash

# all shells
cat /etc/shells

sh # change to boune sh
bash # change to BAsh

vim /etc/passwd

alias
c # alias = clear = Ctl + L


echo "hello world!"
echo 'hello world!'

echo  -e "hello \\ world! \t hello world2!  \n hello world2!"
echo  -e "hello \\ world! \t hello world2!  hello wor\bld2!"
echo  -e "a\tb\tb\tc\na\tb\tb\tc"
echo  -e "\e[1;31m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 31 mean red
echo  -e "\e[1;32m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;33m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;34m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;35m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;36m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;37m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;38m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;39m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed
echo  -e "\e[1;40m  abcdefghijg  \e[0m" # \e[1;31m \e[0m" standard method for color , here 32 ed


grep grep linux_command.bash
grep "aaa*" linux_command.bash
grep "n$" linux_command.bash
grep "^n" linux_command.bash
grep "cc[a-e]*" linux_command.bash

cat /etc/passwd
cut -f 2,4 -d : /etc/passwd # not good for blank, good for tab , : etc 

df -h  
df -h > df_info.txt #file 
less df_info.txt # file 

printf %s asd 123
printf %s %s asd 123
printf '%s %s' asd 123

awk '{printf $2 "\t" $3  "\n"}'  df_info.txt
awk '{printf $2 "\t" $4  "\n"}'  df_info.txt
awk '{printf $2 "\t" $5  "\n"}'  df_info.txt
df -h | grep "sda" | awk '{printf $5 }'  | cut -d "%" -f 1

df -h | grep -v "Use%" | awk '{printf $5 }'  | cut -d "%" -f 1
#df -h | grep -v "%" | awk '{printf $5 }'  | cut -d "%" -f 1

echo df_info.txt | grep "sda" | awk '{printf $5 }'  | cut -d "%" -f 1

awk '{printf $1 }'  df_info.txt 
awk '{printf $2 }'  df_info.txt 
awk '{printf $3 }'  df_info.txt 
awk '{printf $4 }'  df_info.txt 
awk '{printf $5 }'  df_info.txt

awk '{printf $5 }'  df_info.txt | cut -d "%" -f 1

sort -t ":" -k 3,3 /etc/passwd
sort -n -t ":" -k 3,3 /etc/passwd

[ -d /root ] &&  echo yes || echo no

aa=24
bb=36
[ -n "$aa" -a "$aa" -gt 24,  ] &&  echo yes || echo no # $aa exist and larger than 24




ls *.bash > ls.log