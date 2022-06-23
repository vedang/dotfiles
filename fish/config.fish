if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source

fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin

direnv hook fish | source
