# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump battery gem git-flow lein pip python rake rvm redis-cli)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/vedang/bin:/home/vedang/.cljr/bin:/home/vedang/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Convert the Caps Lock key into a Ctrl key
# xmodmap ~/.xmodmap

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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add git-hg to path
export PATH=$PATH:/home/vedang/incoming-src/git-hg/bin/

# Common history across all terminals -- abhishek
export HISTCONTROL=ignoredups:erasedups
export HISTFILE=~/.zsh_history
export HISTFILESIZE=5000
export HISTSIZE=5000
# shopt -s histappend

# globbing
setopt extended_glob

# Java opts
# export JAVA_OPTS="-Xms256M -Xmx512M -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:+DoEscapeAnalysis -XX:+UseBiasedLocking -XX:PermSize=64M -XX:MaxPermSize=256M"
