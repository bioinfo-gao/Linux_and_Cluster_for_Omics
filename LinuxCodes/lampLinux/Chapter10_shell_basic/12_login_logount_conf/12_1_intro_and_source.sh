# 登录欢迎信息
# 本地
cat /etc/issue
# logout
# exit
# 远程
cat /etc/issue.net 
# 但只有把 /etc/ssh/sshd_config 中的Banner 行修改成 /etc/issue.net ，上面的设置才能生效

# 不管本地还是远程都生效，但只有登录成功才能显示
cat /etc/motd



# 环境变量配置文件需要重新登录才能生效
# source 则立即生效

# PATH
# PS1
# HOSTNAME
# HISTSIZE

# for all users <<<========================
# /etc/profile
# /etc/profile.d/*.sh
# /etc/bashrrc

# The specific user <<<========================
# ~/.bash_profile
# ~/.bashrc

# Zhen Note:
# ~/.vinrc

# if [ uid = 0 ], ten sbin added to PATH