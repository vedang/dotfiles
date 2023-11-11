if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source

fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/src/prototypes/bb-scripts/bin
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin
fish_add_path /opt/homebrew/opt/gnupg@2.2/bin

direnv hook fish | source
