# Note: Paths should be in .zshenv

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will load a
# random theme each time oh-my-zsh is loaded, in which case, to know
# which specific one was loaded, run: echo $RANDOM_THEME See
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes Explicitly setting it
# to empty string turns omz themes off. We are doing this to
# explicitly use starship, which is a separate package and needs to be
# separately installed.
ZSH_THEME=""
# Load the starship theme
eval "$(starship init zsh)"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "candy" "kafeitu" "sorin" "spaceship")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         alias-finder
         ansible
         battery
         command-not-found
         direnv
         docker
         docker-compose
         emoji
         fd
         fzf
         golang
         gpg-agent
         jenv
         lein
         man
         mvn
         node
         npm
         nvm
         rsync
         rust
         ssh-agent
         sudo
         themes
         tmux
         # vagrant
         # vagrant-prompt
         # virtualenvwrapper
         zoxide
         zsh-interactive-cd)

# docker settings
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# ssh-agent settings
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities vedang_id_rsa srht.id_rsa
zstyle :omz:plugins:ssh-agent lifetime 24h

# tmux settings
export ZSH_TMUX_ITERM2=true
export ZSH_TMUX_FIXTERM_WITH_256COLOR=xterm-256color
export ZSH_TMUX_UNICODE=true

source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_ALIAS_FINDER_AUTOMATIC=true
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Added automatically by FZF install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/nejo/.config/broot/launcher/bash/br
