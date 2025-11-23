# /dev/stdin   0 
# /dev/stdout  1 
# /dev/stderr  2

cmd > file 
cmd >> file 

stderr 2> file
stderr 2>> file  # no space 

lls 2>> ls_err


cmd >  file 2>&1 # all normal and err  to file 
cmd >> file 2>&1 # all normal and err append to file 
cmd &>  file     # all normal and err to file 
cmd &>> file     # all normal and err append to file 

ls &> /dev/null

# this , we need only file2 to check error message 
cmd >> file1 2>> file2  # normal append to file1 while err append to file2


