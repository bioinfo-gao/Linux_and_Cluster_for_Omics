# root 把只能有超级用户执行的命令赋予普通用户执行

sudo 的操作对象是系统命令

cat /etc/sudoers

## Allows people in group wheel to run all commands
root  ALL=(ALL)       ALL
%wheel  ALL=(ALL)       ALL # wheel group
# 1st ALL (or 本机IP地址) computer belong to this organization
# 2nd ALL as root
# 3rd ALL cmd

man 5 sudoers/

whereis shutdown

visudo # visudo:  just == vim /etc/sudoers: Permission denied

gao ALL=/sbin/shutdown -r now
sc  192.168.0.156=/usr/bin/vim # very Dangerour!  不要赋予这样的工具 管理员权限
# IP 被管理的IP


# sudo 的时候，原用户的各种配置均无法使用
Use the -E flag to preserve your user's environment variables, so sudo inherits your $HOME and loads your configs.

Example for editing a file with Vim:text

udo -E vim /path/to/file # -E