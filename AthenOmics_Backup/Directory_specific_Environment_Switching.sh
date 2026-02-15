这是一个非常典型的“多用户共享单一系统账号”的隔离策略。既然你被限制在 /home/songz/gaoz/ 这个子目录下，且没有 sudo 权限，我们需要利用 Shell Hook 技术来实现“进入目录自动加载环境，退出目录恢复原样”的自动化操作。

在你的英文系统环境下，这种技术通常被称为 "Directory-specific Environment Switching"。

1. The Strategy: "The Smart .bashrc"
由于 Linux 默认只在登录时读取 ~/.bashrc，它不会感知你 cd 到了哪个目录。我们将通过修改 ~/.bashrc（共享账号的根配置），让它监控你的路径。

请将以下代码添加到 /home/songz/.bashrc 的末尾（你可以用 VS Code 直接打开它）：

Bash
# --- gaoz isolation logic ---
GAOZ_HOME="/home/songz/gaoz"

function _gaoz_env_check() {
    # Check if the current working directory is inside GAOZ_HOME
    if [[ "$PWD" == "$GAOZ_HOME"* ]]; then
        # If we just entered, source the config
        if [[ -z "$IN_GAOZ_ZONE" ]]; then
            export IN_GAOZ_ZONE=1
            if [ -f "$GAOZ_HOME/.gaoz_profile" ]; then
                source "$GAOZ_HOME/.gaoz_profile"
            fi
        fi
    else
        # If we just left, restore the original environment
        if [[ -n "$IN_GAOZ_ZONE" ]]; then
            unset IN_GAOZ_ZONE
            # Restore default PS1 (usually Ubuntu default)
            export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
            # Unset gaoz-specific Git configs or paths if necessary
            unset GIT_CONFIG_GLOBAL
        fi
    fi
}

# Add the function to PROMPT_COMMAND (executes every time you hit Enter)
export PROMPT_COMMAND="_gaoz_env_check; $PROMPT_COMMAND"
2. The Private Config: Create .gaoz_profile
现在，在你的子目录 /home/songz/gaoz/ 下创建一个名为 .gaoz_profile 的文件。这是你真正的个人控制中心。

Bash
# /home/songz/gaoz/.gaoz_profile

# 1. Custom PS1 (Color: Cyan for gaoz)
export PS1='\[\e[1;36m\][gaoz-zone] \[\e[1;34m\]\w\[\e[0m\] \$ '

# 2. Private Git Config
# This forces git to use your private config instead of the shared one
export GIT_CONFIG_GLOBAL="$GAOZ_HOME/.gitconfig"

# 3. Private Bin/Tools Path
export PATH="$GAOZ_HOME/bin:$GAOZ_HOME/micromamba/bin:$PATH"

# 4. Conda/Mamba Isolation
# Ensure your environments are created inside your folder
export CONDA_ENVS_PATH="$GAOZ_HOME/envs"
export CONDA_PKGS_DIRS="$GAOZ_HOME/pkgs"

echo "Welcome gaoz! Environment loaded from sub-directory."
3. Isolated Git Setup
在你的目录下创建你个人的 .gitconfig：

Plaintext
# /home/songz/gaoz/.gitconfig
[user]
    name = gaoz
    email = bioinfo.gao@gmail.com
[color]
    ui = auto
4. Technical Details for VS Code
为了让 VS Code 也能识别这个逻辑：

Terminal Integration: 当你在 VS Code 终端 cd 进你的目录时，上面的 PROMPT_COMMAND 会自动把你的颜色变绿（或青色），非常直观。

Extensions: 在 VS Code 的 Remote - SSH 连接中，你可以设置 "Remote.SSH.Default Extensions"，但由于你是共享账号，建议你在 VS Code 中使用 "Workspace Settings"。

5. Managing R44 Environment in a Sub-directory
当你使用 Mamba 安装 R44 时，请务必指定路径，以确保它不占用共享账号的根空间：

Bash
# Create the environment physically inside your sub-folder
micromamba create -p /home/songz/gaoz/envs/R44 r-base=4.4.1 -c conda-forge
Summary of what happens now:
cd /home/songz/gaoz: 终端立刻变色（Cyan），Git 自动切换成你的身份，你的 R44 工具路径被激活。

cd /: 颜色恢复成系统默认，你的私有工具路径被从 PATH 中逻辑移除（虽然环境变量还在，但 IN_GAOZ_ZONE 状态已重置）。

Does this logic match your workflow? 如果可以，你现在就可以在 VS Code 里修改 .bashrc 了。如果你对 PS1 的颜色有特殊要求（比如深绿或紫色），请告诉我，我给你具体的 ANSI Color Codes。