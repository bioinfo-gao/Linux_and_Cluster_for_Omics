https://liaoxuefeng.com/books/git/introduction/index.html

# ========================================= 
首先这里再明确一下，所有的版本控制系统，其实只能跟踪文本文件的改动，比如TXT文件，网页，所有的程序代码等等，Git也不例外。版本控制系统可以告诉你每次的改动，比如在第5行加了一个单词“Linux”，在第8行删了一个单词“Windows”。而图片、视频这些二进制文件，虽然也能由版本控制系统管理，但没法跟踪文件的变化，只能把二进制文件每次改动串起来，也就是只知道图片从100KB改成了120KB，但到底改了啥，版本控制系统不知道，也没法知道。

不幸的是，Microsoft的Word格式是二进制格式，因此，版本控制系统是没法跟踪Word文件的改动的，前面我们举的例子只是为了演示，如果要真正使用版本控制系统，就要以纯文本方式编写文件。

因为文本是有编码的，比如中文有常用的GBK编码，日文有Shift_JIS编码，如果没有历史遗留问题，强烈建议使用标准的UTF-8编码，所有语言使用同一种编码，既没有冲突，又被所有平台所支持

# ========================================= 
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

# ========================================= 

第一天上班时，已经记不清上次怎么修改的readme.txt，所以，需要用git diff这个命令看看：

# ========================================= 

diff --git a/readme.txt b/readme.txt
$ git diff readme.txt 
index 46d49bf..9247db6 100644
--- a/readme.txt
+++ b/readme.txt
@@ -1,2 +1,2 @@
-Git is a version control system.
+Git is a distributed version control system.
 Git is free software.

# ========================================= 
# 我的个人观察，"git reflog" better than "git log" , reflog ==> "reference of log"
# 信息多， 结构清晰，
# ========================================= 
git reflog
6b61aa0 (HEAD -> master, origin/master, origin/HEAD) HEAD@{0}: commit: git_advanced
7c50a2a HEAD@{1}: commit: git lfs
35d1959 HEAD@{2}: commit: remove .gitkeep files
015535e HEAD@{3}: commit: restore
0505634 HEAD@{4}: pull --tags origin master (finish): returning to refs/heads/master
0505634 HEAD@{5}: pull --tags origin master (pick): backup
3469ef3 HEAD@{6}: pull --tags origin master (start): checkout 3469ef3d5afc35e4a992ebd944daed74fedb4ea7
acd19fd HEAD@{7}: commit: backup
0260294 HEAD@{8}: commit: cdroom repair
67169c5 HEAD@{9}: pull --tags origin master: Fast-forward
5003f7c HEAD@{10}: commit: grub crypt
7b98427 HEAD@{11}: commit: double system boot
0e54586 HEAD@{12}: commit: grub mimic /root
e98644d HEAD@{13}: commit: grub
9efeef3 HEAD@{14}: commit: runlevel
113fca9 HEAD@{15}: commit: logrotate
f023a0b HEAD@{16}: commit: log
# ========================================= 
gao@ DESKTOP-C8OKE65  15:33 $ git log
commit 6b61aa013fa8848b868c6ccc7fc64cd38b74f445 (HEAD -> master, origin/master, origin/HEAD)
Author: WSL_Oracle <bioinfo.gao@gmail.com>
Date:   Wed Dec 3 15:34:10 2025 -0500

    git_advanced

commit 7c50a2a590f1d56ed4411f65f2fe35e358bf4037
Author: WSL_Oracle <bioinfo.gao@gmail.com>
Date:   Mon Dec 1 14:12:59 2025 -0500

    git lfs

commit 35d1959eabde38851fe0da0cccb3b69fc0f839fa
Author: WSL_Oracle <bioinfo.gao@gmail.com>
Date:   Mon Dec 1 01:03:46 2025 -0500

    remove .gitkeep files
# =========================================  
# 如果git status告诉你有文件被修改过，用git diff可以查看修改内容。
# =========================================  
On branch master
Your branch is up to date with 'origin/master'.

You are in a sparse checkout with 41% of tracked files present.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   git_Advanced/1_git_advanced_tutorial

no changes added to commit (use "git add" and/or "git commit -a")
# ========================================= 
# git log --pretty=oneline 比git log 好一点，但远不如 git reflog
# ========================================= 
git log --pretty=oneline
6b61aa013fa8848b868c6ccc7fc64cd38b74f445 (HEAD -> master, origin/master, origin/HEAD) git_advanced
7c50a2a590f1d56ed4411f65f2fe35e358bf4037 git lfs
35d1959eabde38851fe0da0cccb3b69fc0f839fa remove .gitkeep files
015535e0e0b6bbcc980e98f3f4d0888507c1d1f1 restore

# ========================================= 
首先，Git必须知道当前版本是哪个版本，在Git中，用HEAD表示当前版本，也就是最新的提交1094adb...
（注意我的提交ID和你的肯定不一样），上一个版本就是HEAD^，上上一个版本就是HEAD^^，
然往上100个版本写100个^比较容易数不过来，
所以写成HEAD~100

# HEAD   HEAD^  HEAD^^  HEAD~100 

# ========================================= 
# 我的观察是 HEAD HEAD@{0} HEAD@{1} HEAD@{2} 
# ========================================= 

6b61aa0 (HEAD -> master, origin/master, origin/HEAD) HEAD@{0}: commit: git_advanced
7c50a2a HEAD@{1}: commit: git lfs
35d1959 HEAD@{2}: commit: remove .gitkeep files
015535e HEAD@{3}: commit: restore

# ========================================= 
# ============版本回退=============== 
# ========================================= 
$ git reset --hard HEAD^
HEAD is now at e475afc add distributed

# ========================================= 
# --hard参数有啥意义？--hard会回退到上个版本的已提交状态，
# --soft会回退到上个版本的未提交状态，
# --mixed会回退到上个版本已添加但未提交的状态。
# 现在，先放心使用--hard 
# ========================================= 
; sd 


# ========================================= 
# 用git log再看看现在版本库的状态
# ========================================= 
# 只要上面的命令行窗口还没有被关掉，你就可以顺着往上找啊找啊，找到那个append GPL的commit id是1094adb...，于是就可以指定回到未来的某个版本：

# $ git reset --hard 1094a
# HEAD is now at 83b0afe append GPL
# 版本号没必要写全，前几位就可以了，Git会自动去找。当然也不能只写前一两位，因为Git可能会找到多个版本号，就无法确定是哪一个了。

# 再小心翼翼地看看readme.txt的内容：
# ========================================= 
# 快捷键会根据编辑器底部状态栏显示的当前语言模式来选择正确的注释符号。
# 如果文件是 Python，它使用 #。
# 如果文件是 JavaScript/C++/Java，它使用 //。
# 如果文件是 Assembly (汇编)、Clojure、INI 或某些配置文件，它可能会使用 ;。
# C language These comments begin with /* and end with */
# C language These comments following // on that line, at  the end of the line, is considered a comment.
# e.g. int x = 10; // This is a single-line comment explaining the variable 'x'.
# =========================================

# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 
# ========================================= 