3 mode:

vim file 直接进入命令模式

命令模式下  "aio" 进入插入模式 , esc 退出插入模式， , :wq 保存并退出
命令模式下  ":"   进入编辑模式 , enter run the cmd , :q  退出命令模式

:n   # :8 go to nth line (8th line)

Cmd Mode      : vim filename  , :wq quit
Insert Mode   : a i o , Esc 
Edit Mode     : start with :, then input cmd in edit mode c, q to quit 

# =================== 
Cmd Mode      : vim filename  , :wq quit

Insert Mode   : a i o  A I O , Esc 
a append the folling character 
A append the folling line 
i insert before the character
I insert before the line 
o insert a new line in the next line
O insert a new line in the Above line

u   # UNdo ============= <<<<<<<<<<<<<<< 

set nu
set nonu

$ line end 
0 line beging

gg to 1st line 
G  to the last line 

:1000 # to line 1000 

x   # del a character 
nx  # del n character 
dd  # del a line 
ndd # del n line
dG  # del to the end of file 
D   # del to end of line


:999-1006d # del the lines in the range  

u   # UNdo

yy  p
dd p  # paste to next line 

ndd P # P paste to the Above line 

r # replace a character 
R # replace a string until Esc to end replace 

/string # search 
set ic  # ignore case 
n # next string 
:%s/old/new/g  #global replacement 
:n1, n2 s/old/new/g  #global replacement 
:n1, n2 s/old/new/c  #global replacement with asking 

:wq
:wq! #save by force 
ZZ == :wq



Edit Mode     : start with :, then input cmd in edit mode c, q to quit 