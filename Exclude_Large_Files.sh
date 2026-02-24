# 1. 进入你的 bioinfo 目录
cd /home/songz/gaoz

# 找出大于 50M 的文件
find . -type f -size +50M
强制排除：如果发现漏网之鱼，随时修改 .gitignore，然后执行 git rm -r --cached . 刷新缓存，再重新 git add .。

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