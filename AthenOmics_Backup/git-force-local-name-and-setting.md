git config --list --show-origin
查看输出中 user.name 这一行。如果它显示的是来自 /home/songz/.gitconfig（小组公共路径），说明你的环境变量被覆盖了或者没有生效。

echo $GIT_CONFIG_GLOBAL
如果输出为空：说明你的 .gaoz_profile 没有被正确 source。请运行 source /home/songz/gaoz/.gaoz_profile。

cd /home/songz/gaoz/Linux_Cluster_Project
git config user.name "gaoz"
git config user.email "bioinfo.gao@gmail.com"

# 如果你有很多个仓库，不想每个都手动 include，请在你的 .gaoz_profile 中添加这个 Alias：
# Add this to your /home/songz/gaoz/.gaoz_profile
alias git='git -c user.name="gaoz" -c user.email="bioinfo.gao@gmail.com" -c core.excludesfile="/home/songz/gaoz/.gitignore_global"'

# ln -s <TARGET_REAL_FILE_OR_DIR> <LINK_NAME>
ln -s /home/songz/gaoz/Linux_Cluster_Project/AthenOmics_Backup/.gaoz_profile_raw .gaoz_profile

ln -s /home/songz/gaoz/Linux_Cluster_Project/AthenOmics_Backup/.gaoz_profile_raw .gaoz_profile
ln -s /home/songz/lhn_work/Project_2025/  lhn_Project_2025

#  奇怪的是，在git 图形化操作，还是 yiouyou
# cmd Sucessful! 
git add .

git commit -m "G-Zone-GZ"
git push




<!-- # 1. Kill any active processes running under the 'gaoz' user
sudo killall -u gaoz
# 2. Delete the user and their home directory (-r means recursive/remove home)
sudo userdel -r gaoz -->