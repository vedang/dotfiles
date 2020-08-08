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

# Add `diff-highlight` to the path for both Linux and OSX
export PATH="$PATH::/usr/share/doc/git/contrib/diff-highlight:/usr/local/Cellar/git/$(git --version | cut -f3 -d' ')/share/git-core/contrib/diff-highlight"

# Add Golang to the path
export GOPATH="$HOME/src/golang"
export PATH="$GOPATH/bin:$PATH"

# Emacs for everything!
export EDITOR="/usr/bin/emacsclient"
export CSCOPE_EDITOR="/usr/bin/emacsclient"
export VISUAL="/usr/bin/emacsclient"

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
}
load_secrets

# Load completion for go-jira
eval "$(jira --completion-script-zsh)"
