3 mode:

vim file 直接进入命令模式

命令模式下  "aio" 进入插入模式 , esc 退出插入模式， , :wq 保存并退出
命令模式下  ":"   进入编辑模式 , enter run the cmd , :q  退出命令模式

:n   # :8 go to nth line (8th line)

导入文件内容到光标所在位置         :r /etc/issue
在不退出vim的时候执行一个命令 :! ls ==> 按照屏幕提示 enter 返回编辑器  
导入命令执行执行结果到光标所在位置  :r !cmd 
# 导入命令执行执行结果到光标所在位置  :r !date 

ctrl $ go to end of line 

ctrl 0 go to begining of line 
ctrl ^ go to begining of line 

:1,4s/^/#/ # 1-4行添加 # comment out  
:1,4s/^/\/\// # 1-4行添加 // comment out  \转义符
:1,4s/^#// # 1-4行添加 remove # 
