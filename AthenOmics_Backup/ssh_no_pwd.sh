# 切换到 gaoz 的家目录
mkdir -p /home/gaoz/.ssh

# 将复制的内容粘贴到下面引号里
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICETvrB4uPMR/ZAM5ErEL9oueVC5jpnUp0YVh++SaqDR bioinfo.gao@gmail.com" > /home/gaoz/.ssh/authorized_keys

# 纠正权限（SSH 报错最常见的原因）
chown -R gaoz:gaoz /home/gaoz/.ssh
chmod 700 /home/gaoz/.ssh
chmod 600 /home/gaoz/.ssh/authorized_keys