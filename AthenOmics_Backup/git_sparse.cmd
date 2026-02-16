cd ~/linux_opt_in_Sys_n_Omics
git init
git remote add origin https://github.com/bioinfo-gao/Linux_and_Cluster_for_Omics.git
#"你要上传的文件夹名称"
git sparse-checkout set AthenOmics_Backup
git add .

# the following 2 lines 设置 Git 用户信息（如果之前没有设置过）, only once, 之后就不需要再设置了
git config --global user.email "bioinfo.gao@gmail.com"
git config --global user.name "gaoz from AthenOmics"

git commit -m "Add AthenOmics CMD folder without downloading other files"

# 注意：如果远程已有内容，直接 push 可能会报错。
# 我们可以先 pull 远程的 readme 或 metadata (这只会下载极少的文件)
git pull origin main --rebase
git push origin main

# 进入项目目录
cd /home/songz/gaoz/Linux_Cluster_Project
# 增加你想下载的新目录名 (例如：New_Analysis_Folder)
git sparse-checkout add AI_Helper 

git add .
git commit -m "Add new local directory to G-Zone project"
# 注意：根据你的设置，这里使用 master 分支
git push origin master