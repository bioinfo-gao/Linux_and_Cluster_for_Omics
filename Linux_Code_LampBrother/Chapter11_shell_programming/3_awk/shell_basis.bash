cd 
cat .sh_history
cat /etc/profile
echo $PATH
whereis is
whereis cd
alias 
vim .bashrc 

# quick key
Ctrl A # goto begiinng  
Ctrl E # ned
Ctrl C # stop
Ctrl Z # suspend to background
Ctrl U # clear all text in current line
Ctrl K # clear all text in current line after the font 
Ctrl Y # paste the text cut from Ctrl U/ Ctrl K
Ctrl D #logout

/dev/stdin # keyboard  
/dev/stdout # monitor 
/dev/stderr # monitor for error 

# output redirection
ls > ls_abc
cat  ls_abc

lsabc 2>> ls_abc
tail  ls_abc

# /home/gao/Desktop/Code/Linux_Code
l. >> ls_abc 2>> lex_eror #  error report to the same file as correct file , the corret file to, 
lss. >> ls_abc 2>> lex_eror #  error report to a file , the corret file to another file, 

l. > ls_abc 2>&1 #  error report to the same file as correct file , the corret file to, 

lldd. > ls_abc 2>&1 #  error report to the same file as correct file , the corret file to, 

tail  ls_abc
tail  lex_eror   

date &>> ls_abc # both corrent and error report to this file , moden method
tail  ls_abc

ls &> /dev/null # all file to null file


# input redirection
wc < ls_abc # wc  ls_abc


