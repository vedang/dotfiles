# If not running interactively, don't do anything
[ -z "$PS1" ] && return

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     this_machine=Linux;;
    Darwin*)    this_machine=Mac;;
    CYGWIN*)    this_machine=Cygwin;;
    MINGW*)     this_machine=MinGw;;
    *)          this_machine="UNKNOWN:${unameOut}"
esac
echo "Welcome to a productive session on your ${this_machine}"

# bash completion
if [ "${this_machine}" = "Mac" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
elif [ "${this_machine}" = "Linux" ]; then
    source /etc/profile.d/bash_completion.sh
fi

# Settings for Mac
export LC_ALL="en_US.UTF-8"
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
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$HOME/.jenv/bin:/usr/local/opt/node@6/bin:$PATH:/Users/vedang/src/bin:/usr/local/Cellar/git/$(git --version | cut -f3 -d' ')/share/git-core/contrib/diff-highlight:/usr/share/doc/git/contrib/diff-highlight"

# Rust Path changes
export PATH="$HOME/.cargo/bin:$PATH"

# Settings for Jenv. Assumes it is installed in ~/.jenv (in the PATH export above)
eval "$(jenv init -)"

export HOMEBREW_NO_AUTO_UPDATE=1

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


# Vagrant helper functions
source /Users/vedang/Documents/private-dotfiles/virtualization/vagrant_global_helpers.sh
# Private content
function load_secrets () {
  export LEIN_USERNAME=$(security find-generic-password -a "Lein username" -s "Lein username" -w)
  export LEIN_PASSPHRASE=$(security find-generic-password -a "Lein passphrase" -s "Lein passphrase"  -w)
  export NPM_TOKEN=$(security find-generic-password -a "NPM token" -s "NPM token"  -w)
}
load_secrets
export LEIN_SNAPSHOTS_IN_RELEASE=true
export LEIN_JVM_OPTS="-Dhttps.protocols=TLSv1.2"
export HOMEBREW_NO_AUTO_UPDATE=1

# start ssh agent at startup
# http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"

start_agent () {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo "succeeded"
     chmod 600 "${SSH_ENV}"
     source "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add -t 86400 -k "$HOME/.ssh/hs_prod"; ### USE YOUR PRIVATE KEY HERE ###
     /usr/bin/ssh-add -t 86400 -k "$HOME/.ssh/id_rsa";
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

SHIVAHOME="$HOME/src/palantir/vagrant_envs/localshiva/" # change this path according to where you store palatir
alias shivassh="cd $SHIVAHOME ; vagrant ssh; cd - ;"
alias shivastart="cd $SHIVAHOME ; vagrant up; cd - ;"
alias shivastop="cd $SHIVAHOME ; vagrant halt; cd - ;"

# Move to rbenv
# eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Load aliases
source "${HOME}/.bash_aliases"

# Load completion for Go Jira
eval "$(jira --completion-script-bash)"
export PATH="/usr/local/sbin:$PATH"
