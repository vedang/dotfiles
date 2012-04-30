# Emacs for everything!
export EDITOR="emacsclient -c"
export CSCOPE_EDITOR="emacsclient -c"
export VISUAL="emacsclient -c"
# Load settings for virtualenv (python)
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenv
# Add Ruby gems to the path (required for octopress)
export PATH=$PATH:/var/lib/gems/1.8/bin/
[[ -s "/home/vedang/.rvm/scripts/rvm" ]] && source "/home/vedang/.rvm/scripts/rvm"
# Some important aliases and key bindings
alias tlock='gnome-screensaver-command --lock;'
alias defunct='ps aux | grep defunct;'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
# Add git-hg to path
export PATH=$PATH:/home/vedang/incoming-src/git-hg/bin/
# Common history across all terminals -- abhishek
export HISTCONTROL=ignoredups:erasedups
export HISTFILE=~/.bash_history
export HISTFILESIZE=5000
export HISTSIZE=5000
shopt -s histappend
# Add lein bin to the path
export PATH=$PATH:/home/vedang/bin/
