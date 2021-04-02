# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add `diff-highlight` to the path for both Linux and OSX
export PATH="$PATH:/usr/share/doc/git/contrib/diff-highlight:/usr/local/Cellar/git/$(git --version | cut -f3 -d' ')/share/git-core/contrib/diff-highlight"

# Add lein to the path
export PATH="$PATH:${HOME}/src/bin"

# Add cargo/bin to the path.
export PATH="$PATH:${HOME}/.cargo/bin"
# Define RUST_SRC_PATH for tooling to work.
export RUST_SRC_PATH="${HOME}/src/rust"

# Add Golang to the path
export GOPATH="$HOME/src/golang"
export PATH="$GOPATH/bin:$PATH"

# Add NPM to the Path
export PATH="$PATH:/usr/local/npm_packages/bin"

# Emacs for everything!
if [ -f "/Applications/Emacs.app/Contents/MacOS/Emacs" ]; then
  export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
  alias emacs="$EMACS -nw"
fi

if [ -f "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient" ]; then
    export PATH="$PATH:/Applications/Emacs.app/Contents/MacOS/bin"
fi
export EDITOR=emacsclient
export CSCOPE_EDITOR=emacsclient
export VISUAL=emacsclient

# Add Cask to te Path
export PATH="$HOME/.cask/bin:$PATH"
