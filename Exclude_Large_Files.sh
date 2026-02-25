# 1. 进入你的 bioinfo 目录
cd /home/songz/gaoz

# 找出大于 50M 的文件
find . -type f -size +50M
强制排除：如果发现漏网之鱼，随时修改 .gitignore，然后执行 git rm -r --cached . 刷新缓存，再重新 git add .。

# 列出暂存区中所有文件的大小，过滤出大于 50,000 KB (约 50MB) 的文件
git ls-files --stage | cut -f 2 -d ' ' | xargs -I {} git cat-file -s {} | awk '{if ($1 > 52428800) print $1/1024/1024 " MB"}'

# 列出当前分支追踪的所有文件，按大小排序，取前 20 个 , 可直接显示文件的大小和路径， 多少MB 
git ls-tree -r -l --long master | sort -n -k 4 -r | head -n 20 | awk '{printf "%-10s %s\n", $4/1024/1024 "MB", $5}'

# 3. 终极扫描：检查“整个 Git 历史”
# 有时候你本地虽然删了文件，但 Git 历史里还存着它的备份。这行“核弹级”命令可以扫描整个 .git 文件夹里的巨无霸：

# 找出仓库历史中最大的 10 个文件（包括已删除但仍在历史中的）
git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{

首先，我们将常见的生信大数据格式全部排除。请在你的 bioinfo 根目录下执行：

vim .gitignore

# # 排除所有可能的二进制大数据
# *.zip
# *.tar.gz
# *.7z
# *.rar
# *.iso
# # 排除生信特有大数据 (增加常见格式)
# *.bam
# *.sam
# *.fastq
# *.fq
# *.fastq.gz
# *.fq.gz
# *.pod5
# *.fast5
# *.vcf.gz
# *.bigWig
# *.bw
# *.h5

# 2. 找出当前目录下所有大于 50M 的文件，并将其路径写入 .gitignore
# 注意：grep -v ".git" 是为了避开 git 自身的元数据
find . -type f -size +50M | grep -v ".git" | sed 's|^\./||' >> .gitignore

# 3. 对 .gitignore 进行去重处理
sort -u .gitignore -o .gitignore


# 如果你之前已经运行过 git add .，即使你现在改了 .gitignore，那些大文件可能还在暂存区。必须执行以下“刷新”操作：

# 强制移除所有缓存（不会删除你的本地文件）
git rm -r --cached .

# 重新添加（此时 .gitignore 会生效，过滤掉 >50M 的文件）
git add .

# 检查一下还有没有大文件漏网
# 如果没有输出，说明成功了
git status

git commit -m "all files exclude large ones "

git push

/home/songz/gaoz/GZ_Project_2026/.git/index.lock