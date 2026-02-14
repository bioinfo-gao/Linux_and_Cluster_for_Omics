cd ~/linux_opt_in_Sys_n_Omics
git init
git remote add origin https://github.com/bioinfo-gao/Linux_and_Cluster_for_Omics.git
#"你要上传的文件夹名称"
git sparse-checkout init --cone
git sparse-checkout set AthenOmics_Backup
git sparse-checkout set "AthenOmics_Backup/*"

# the following 2 lines 设置 Git 用户信息（如果之前没有设置过）, only once, 之后就不需要再设置了
git config --global user.email "bioinfo.gao@gmail.com"
git config --global user.name "gaoz from AthenOmics"


git pull origin main --rebase

git add .

# 1. 强制获取远程最新的 master 记录（但不合并）
git fetch origin master

# 2. 将本地分支重置到远程的起点，但保留你的本地文件修改（--soft）
# 注意：这会让你的本地文件看起来像是“刚 add 完等待 commit”的状态
git reset --soft origin/master

# 3. 重新提交（这会将你的新文件夹合并进远程的历史记录中）
git commit -m "Merge local AthenOmics_Backup with remote master"

# 4. 推送
git push origin master


git pull origin master --rebase
git add AthenOmics_Backup/
git add -f AthenOmics_Backup/
git commit -m "Update: Added AthenOmics_Backup folder safely"
git push origin master