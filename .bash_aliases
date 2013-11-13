alias rsync='rsync -av --progress'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -l --color=auto'
alias lsgt="git tag | xargs -I@ git log --format=format:'%ci %H @%n' -1 @ | sort"
