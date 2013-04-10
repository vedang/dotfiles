# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


# some ls aliases
alias ls='ls -Gpl'
alias rsync='rsync -av --progress'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if [ -f /usr/local/etc/bash_completion.d ] && ! shopt -oq posix; then
#    source /usr/local/etc/bash_completion.d/*
# fi


# Emacs for everything!
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
alias emacsclient="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
export EDITOR="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
export CSCOPE_EDITOR="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
export VISUAL="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"


# Load settings for virtualenv (python)
# export WORKON_HOME=~/.virtualenv
# source /usr/local/bin/virtualenvwrapper.sh


# Add other bin directories to the path
export PATH=/usr/local/bin:$PATH:/Users/vedang/Documents/bin:/usr/local/sbin:/usr/local/lib/python2.7/site-packages:/usr/local/share/npm/bin
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

# Paths for Mahout and Hadoop
export MAHOUT_HOME="/Documents/incoming-src/mahout"
export HADOOP_HOME="/usr/local/Cellar/hadoop/1.0.4/libexec"
export HADOOP_CONF_DIR="$HADOOP_HOME/conf"
export JAVA_HOME="$(/usr/libexec/java_home)"

# Paths for EC2 API Tools and ELB Tools
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"

# Add completion for Git.
source /usr/local/etc/bash_completion.d/git-completion.bash
# Change prompt for git goodness
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\n\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
