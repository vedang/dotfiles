# If not running interactively, don't do anything
[ -z "$PS1" ] && return


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
export PATH=$PATH:/Users/vedang/Documents/bin:/usr/local/sbin:/usr/local/lib/python2.7/site-packages
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

# Add completion for Git.
source /usr/local/etc/bash_completion.d/git-completion.bash
# Change prompt for git goodness
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\n\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
