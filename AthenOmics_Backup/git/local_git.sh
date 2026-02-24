# 要在同一台 Linux 服务器（songz 用户）上完美切换多个 GitHub 身份，你需要解决两个层面的问题：“你是谁”（Commit 签名） 和 “你怎么证明是你”（SSH/HTTPS 推送权限）。
# 目前你的 VSCode Graph 显示 yiouyou 在提交，说明你的 全局配置 (Global Config) 被设置成了 yiouyou。
# 以下是针对 gaoz 项目目录的修复方案：

# 第一步：修改特定目录的“身份签名” (Git Config)
# Git 允许你为某个特定的文件夹设置独立的身份，这会覆盖全局设置。
# 进入你的项目目录：

# Bash
cd /home/songz/gaoz/Linux_Cluster_Project

# 设置局部（Local）用户名和邮箱：
# 这里的邮箱必须是和你 GitHub 账号 bioinfo-gao 绑定的那个邮箱。

# Bash
git config --list # 列出所有配置
# 只查看当前仓库（local）定义的用户名
git config --local user.name
# 只查看当前仓库定义的邮箱
git config --local user.email
# set name and Email 
git config --local user.name "gaoz"
git config --local user.email "bioinfo.gao@gmail.com"

# 验证修改：Bash
git config --local -l

# 现在，在这个目录下进行的任何新提交（Commit），在 VSCode 里都会显示为 gaoz。
# 第二步：修改“推送权限” (SSH 身份切换)
# 即便你改了名字，如果你在 git push 时，系统自动调用了 yiouyou 的 SSH 密钥，GitHub 依然可能拒绝你，或者在某些统计里记错人。
# 最好的办法是配置 ~/.ssh/config 文件：
# 确认你为 gaoz 生成了独立的 SSH 密钥（如果没有，请生成一个，起名为 id_rsa_gaoz）：
# Bash "你的bioinfo-gao绑定邮箱"
ssh-keygen -t ed25519 -C "bioinfo.gao@gmail.com" -f ~/.ssh/id_rsa_gaoz
cat /home/songz/.ssh/id_rsa_gaoz.pub
#（然后记得把 .ssh/id_rsa_gaoz.pub 的内容添加到 GitHub 账号 bioinfo-gao 的 SSH Keys 里）

#编辑 SSH 配置文件：
vim ~/.ssh/config
添加/修改如下内容，实现身份分流：

# 身份 B (默认身份)
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_yiouyou

# 身份 A (gaoz 的专用映射)
Host github-gaoz
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_gaoz

# 第三步：调整项目的 Remote URL
# 既然我们在 SSH Config 里给 gaoz 起了一个别名 github-gaoz，我们需要让你的项目使用这个别名：
# 查看当前的远程仓库地址：

git remote -v
# 如果是 git@github.com:xxx/repo.git。
# 修改它以匹配 SSH Config 的别名：

# git remote set-url origin git@github-gaoz:bioinfo-gao/你的仓库名.git

# 第四步：进阶自动化（强烈推荐）
# 既然你在 /home/songz/ 下有明确的目录划分，你可以让 Git 自动根据目录切换身份，一劳永逸。
# 编辑全局配置文件：

vim ~/.gitconfig
在文件末尾添加以下逻辑：

[user]
    name = yiouyou
    email = yiouyou的邮箱@example.com

# 如果路径包含 /gaoz/，则自动引入另一个配置文件
[includeIf "gitdir:~/gaoz/"]
    path = ~/.gitconfig-gaoz

# 创建 gaoz 的专属配置文件：

vim ~/.gitconfig-gaoz
# 写入内容：

[user]
    name = gaoz
    email = bioinfo.gao@gmail.com
# 结果：以后只要你在 ~/gaoz/ 及其任何子目录下工作，Git 会自动把身份切成 gaoz，再也不会发生用错身份的情况。
# 总结
# 改签名：用 git config --local 解决 VSCode 图标显示问题。
# 改推送：用 ~/.ssh/config 和 git remote set-url 解决 GitHub 权限问题。
# 自动化：用 includeIf 彻底解决以后新项目的身份切换问题。



在尝试 git push 之前，先测试这个别名是否生效：

ssh -T git@github.com-gaoz

git remote -v
git add .
git commit -m "add new local ID"
git push 