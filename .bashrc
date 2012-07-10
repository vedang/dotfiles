# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# some ls aliases
alias ls='ls -Gpl'

# Emacs for everything!
export EDITOR="emacsclient -c"
export CSCOPE_EDITOR="emacsclient -c"
export VISUAL="emacsclient -c"
# Load settings for virtualenv (python)
#source /usr/local/bin/virtualenvwrapper.sh
#export WORKON_HOME=~/.virtualenv
# Add lein bin to the path
export PATH=$PATH:/Users/vedang/Documents/bin/
# Add completion for Git.
source /usr/local/git/contrib/completion/git-completion.bash
# Change prompt for git goodness
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\n\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
