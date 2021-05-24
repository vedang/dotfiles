unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     this_machine=Linux;;
    Darwin*)    this_machine=Mac;;
    CYGWIN*)    this_machine=Cygwin;;
    MINGW*)     this_machine=MinGw;;
    *)          this_machine="UNKNOWN:${unameOut}"
esac
echo "Welcome to a productive session on your ${this_machine} device!"

# Set up Zoxide aliases
eval "$(zoxide init zsh)"

# Stop auto-update for Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# Leiningen Settings
export LEIN_SNAPSHOTS_IN_RELEASE=true
export LEIN_JVM_OPTS="-Dhttps.protocols=TLSv1.2"

# Private content
function load_secrets () {
  export LEIN_USERNAME=$(security find-generic-password -a "Lein username" -s "Lein username" -w)
  export LEIN_PASSPHRASE=$(security find-generic-password -a "Lein passphrase" -s "Lein passphrase"  -w)
  export NPM_TOKEN=$(security find-generic-password -a "NPM token" -s "NPM token"  -w)
  export JENKINS_USER=$(security find-generic-password -a "Jenkins user" -s "Jenkins user"  -w)
  export JENKINS_PASSWORD=$(security find-generic-password -a "Jenkins password" -s "Jenkins password"  -w)

}

# Load completion for go-jira
eval "$(jira --completion-script-zsh)"

# Add extra super functionality for FZF
source "${HOME}/src/dotfiles/fzf-extra.zsh"

# Hook direnv in the shell
eval "$(direnv hook zsh)"

## Aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias e='exa -l'
alias time='hyperfine'
alias fd='fd --hidden --no-ignore'

alias lsgt="git tag | xargs -I@ git log --format=format:'%ci %H @%n' -1 @ | sort"

# Ledger Aliases
alias lreport='/usr/local/Cellar/ledger/3.1.1_2/share/ledger/contrib/report'
alias gledger='gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | ledger -f -'
alias greport='gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | lreport -f -'

# Only on the Mac
if [ ${this_machine} = "Mac" ]
then
   # Mac equivalent of netstat -pantu
   alias lstcp="lsof -n -i4TCP:$1 -sTCP:LISTEN"
   # Brew Aliases
   alias rebrew='brew outdated | cut -f1 | xargs brew upgrade'
   export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
   eval "$(/Users/vedang/.rakubrew/bin/rakubrew init Zsh)"
   export PATH="/usr/local/opt/ruby/bin:$PATH"
   load_secrets
fi
