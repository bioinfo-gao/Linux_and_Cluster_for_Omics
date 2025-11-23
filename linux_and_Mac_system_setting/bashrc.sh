# save as .bashrc in home directory
# source .bashrc in terminal to activate the changes
export CLICOLOR=1
alias l="ls -CF"
alias ll="ls -l"
alias la="ls -a"
alias ld="ls -d -l */"
alias lld="ls -dl */"
alias lla="ls -la"
alias lh="ls -lah"
alias llh="ls -lah"
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias c='clear'
alias h='history'


GREEN='\e[1;32m'
YELLOW='\e[33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
CYAN='\e[1;36m'


#PS1="\[\033[1;92m\]\w : \[\033[0m\] \n\[\033[1;31m\]\u@\h $\[\033[0m\] "
PS1="\[\033[1;35m\]\w : \[\033[0m\] \n\[\033[1;34m\]\u@\[\033[0m\] \[\033[1;31m\]\h $\[\033[0m\] "


export RSTUDIO_WHICH_R=/opt/anaconda3/envs/R41/bin/R