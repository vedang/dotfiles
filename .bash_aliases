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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -Gpl'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

