# (3) ============= cron 定时任务 ========================
# cron是Linux系统中用于定时执行任务的守护进程
# 定时任务配置文件位于 /etc/crontab 和 /etc/cron.d 目录下
# 用户级别的定时任务配置文件位于 /var/spool/cron/crontabs 目录下
# 系统级别的定时任务脚本存放在 /etc/cron.hourly/, /etc/cron.daily/, /etc/cron.weekly/, /etc/cron.monthly/ 目录下
cron.dir/       # 存放系统级别的定时任务脚本 

chkconfig --list | grep crond  # 查看cron服务状态
systemctl status crond         # 查看cron服务状态
systemctl start crond          # 启动cron服务

crontab -l        # 查看当前用户的定时任务
crontab -e        # 编辑当前用户的定时任务, 实际上是vim
# crontab文件格式: 分 时 日 月 周      ==>> 命令
# 示例: 每天凌晨2点执行备份脚本
0 2 * * * /path/to/backup_script.sh >> /path/to/backup.log 2>&1

# 示例: 每天凌晨2点45分执行备份脚本
45 2 * * * /path/to/backup_script.sh >> /path/to/backup.log 2>&1

# 示例: 每月1号和16号凌晨2点45分执行备份脚本
45 2 1,16 * * /path/to/backup_script.sh >> /path/to/backup.log 2>&1

# 示例: 每周1-5的4点45分执行备份脚本
45 4  * * 1-5 /path/to/backup_script.sh >> /path/to/backup.log 2>&1

# 示例: 每天4点， 每格10分执行备份脚本
*/10 4  * * 1-5 /path/to/backup_script.sh >> /path/to/backup.log 2>&1

# 以下最好不要同时出现两个时间限制条件，以免产生歧义，建议只使用其中一个，理论上是可以同时使用的
# 示例: 每月1号和15号的凌晨0点执行备份脚本,每周一的凌晨0点执行备份脚本， 两者满足其一即可执行
0 0 1,15 *  1 /path/to/backup_script.sh >> /path/to/backup.log 2>&1

# 示例: 每周二的凌晨6点05分重启服务器
5 6 * *  2 /sbin/shutdown -r now >> /path/to/backup.log 2>&1
5 6 * *  2 echo $(date) >> /tmp/test_cron.log 2>&1

# 创建备份脚本的硬链接到本章节目录，方便演示cron定时任务
# ln 源文件 目标文件
ln /home/gao/Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter11_shell_programming/7_if_check_backup/3_backup.sh \
   /home/gao/Code/Linux_and_Cluster_for_Omics/Linux_Code_LampBrother/Chapter13_system_manegement/3_backup_hardlink.sh