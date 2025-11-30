# (4) =====================================================
# 启动和自启动源码包安装的服务

/usr/local/apache2/bin/apachectl -k start|stop 
# 自启动源码包安装的服务
vim #修改文件 
/usr/local/apache2/bin/apachectl -k start|stop 

源码包的服务，一般没有专门的服务管理脚本
# 需要自己添加启动命令到 /etc/rc.local 文件中
# 这样就可以实现自启动
可以被chkconfig 管理 可以被ntsysv管理

vim /etc/init.d/apache2   # 创建服务脚本,add the following content:
```bash
#!/bin/bash
# chkconfig: 35 86 76
# description: Apache Web Server
```
# or
chkconfig --add apache2  # 添加到chkconfig管理
description "Apache Web Server"  # 描述信息, 可选
# 默认运行级别和优先级设置
# chkconfig 35 86 76  # 设置启动级别和优先级
# etc/rc.d/rc3.d/   # 查看已有的启动顺序，不要与现有冲突 rc ==== run control .d directory
# ，执行上一句执行顺序之后，脚本会自动生成对应的链接文件
# etc/rc.d/rc3.d/K76apache2  # runlevel 3


chmod +x /etc/init.d/apache2  # 赋予执行权限



# (5) =====================================================
#