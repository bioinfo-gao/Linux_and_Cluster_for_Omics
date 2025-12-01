# (1) ============= 备份概述
# 备份是指将重要数据复制到其他存储介质，以防止数据丢失或损坏
# 常见的备份方法包括全量备份、增量备份和差异备份
# 备份工具有rsync、tar、dd等    

# (2) =============
完全备份 vs 增量备份 v.s 差异备份
# 完全备份: 备份所有选定的数据，每次备份都包含所有数据
# 增量备份: 仅备份自上次备份以来发生变化的数据，节省存储空间和时间
# 差异备份: 备份自上次完全备份以来发生变化的数据，介于完全备份和增量备份之间

# (3) =============dump 和 restore 命令 ========================
# dump命令用于备份ext2/ext3/ext4文件系统的数据
# restore命令用于从dump备份中恢复数据   
# dump命令语法: dump [选项] <备份级别> <设备文件> <备份文件>
# restore命令语法: restore [选项] <备份文件>
# 备份级别: 0表示完全备份，1-9表示增量备份的级别    
dump -0u -f /backup/full_backup.dump /dev/sda1  # 对/dev/sda1进行完全备份，备份文件为/full_backup.dump
dump -1u -f /backup/incremental_backup.dump /dev/sda1  # 对/dev/sda1进行增量备份，备份文件为/incremental

只有备份分区的时候才可以使用dump命令 进行增量备份

文件和目录不存在增量备份，会自动变成完全备份


# 恢复有模式，选择合适的模式进行恢复
# 选择交互模式恢复数据
restore -i -f /backup/full_backup.dump  # 以交互模式从完全备份文件/full_backup.dump中恢复数据
# 选择列表模式查看备份内容
restore -t -f /backup/full_backup.dump  # 以列表模式查看完全备份文件/full_backup.dump的内容
# 选择恢复模式恢复数据
restore -rf /backup/full_backup.dump  # 从完全备份文件/full_backup.dump中恢复数据

# 选择比较模式比较备份内容
restore -c -f /backup/full_backup.dump  # 以比较模式比较完全备份文件/full_backup.dump的内容

# 选择恢复模式并覆盖现有文件恢复数据
restore -rf /backup/full_backup.dump  # 从完全备份文件/full_backup.dump中恢复数据

# 恢复原始备份
restore -r -f /backup/full_backup.dump  # 从完全备份文件/full_backup.dump中恢复数据

# 恢复增量备份1
restore -r -f /backup/incremental_backup1.dump  # 从增量备份

# 恢复增量备份2
restore -r -f /backup/incremental_backup2.dump  # 从增量备份2.dump中恢复数据

# (4) ============= 还原分区 
# 使用restore命令还原整个分区的数据
# 注意: 还原分区会覆盖现有数据，请谨慎操作
restore -rf /backup/full_backup.dump  # 从完全备份文件/full_backup.dump中还原整个分区的数据