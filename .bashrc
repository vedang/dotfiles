# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# some ls aliases
alias ls='ls -Gpl'

# Settings for Mac
export LC_ALL="C"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Emacs for everything!
export EDITOR="/usr/local/bin/emacsclient"
export CSCOPE_EDITOR="/usr/local/bin/emacsclient"
export VISUAL="/usr/local/bin/emacsclient"

# Load settings for virtualenv (python)
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
export WORKON_HOME=~/.virtualenv
source /usr/local/bin/virtualenvwrapper.sh
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python2 "$@"
    else
        /usr/local/bin/python2 "$@"
    fi
}

# Add other bin directories to the path
export PATH=$HOME/.jenv/bin:/usr/local/opt/node@6/bin:$PATH:/Users/vedang/src/bin:/usr/local/Cellar/git/2.17.1/share/git-core/contrib/diff-highlight/

# Settings for Jenv.
eval "$(jenv init -)"

# alias for great good
alias rsync='rsync -avz --progress'
alias gfo='git fetch origin'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias lsgt="git tag | xargs -I@ git log --format=format:'%ci %H @%n' -1 @ | sort"
# Mac equivalent of netstat -pantu
alias lstcp="lsof -n -i4TCP:$1 -sTCP:LISTEN"
# Ledger Aliases
alias lreport='/usr/local/Cellar/ledger/3.1.1_2/share/ledger/contrib/report'
alias gledger='gpg -d ~/Documents/diary/money/ledger.gpg | ledger -f -'
alias greport='gpg -d ~/Documents/diary/money/ledger.gpg | lreport -f -'
#Brew Aliases
alias rebrew='brew outdated | cut -f1 | xargs brew upgrade'

export HOMEBREW_NO_AUTO_UPDATE=1
# Paths for Mahout and Hadoop
# export MAHOUT_HOME="/Documents/incoming-src/mahout"
# export HADOOP_HOME="/usr/local/Cellar/hadoop/1.0.4/libexec"
# export HADOOP_CONF_DIR="$HADOOP_HOME/conf"
export JAVA_HOME="$(/usr/libexec/java_home)"

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# Paths for EC2 API Tools and ELB Tools
# export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
# export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
# export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"
# export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.23.0/libexec"

# Add completion for Git.
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

# Change prompt for git goodness
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\n\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"

function c() {
    cd "$@" && ls
}

# Go related paths
export GOPATH="$HOME/src/golang"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# start ssh agent at startup
# http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"

start_agent () {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo "succeeded"
     chmod 600 "${SSH_ENV}"
     source "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add "$HOME/.ssh/hs_prod"; ### USE YOUR PRIVATE KEY HERE ###
     /usr/bin/ssh-add "$HOME/.ssh/id_rsa";
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     source "${SSH_ENV}" > /dev/null
     ps "${SSH_AGENT_PID}" | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# Colorized ls output
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
else
    if [[ $(echo "$OS_TYPE") != "linux-gnu" ]]; then
        # osx specific
        export CLICOLOR="1"
        export LSCOLORS="GxFxCxDxBxegedabagaced"
    fi
fi

# maintain bash history across all sessions
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL="ignoreboth:erasedups"
shopt -s histappend
PROMPT_COMMAND="history -a"

# Colorised man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

