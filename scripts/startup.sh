echo "Running startup commands"
sh ~/.bash_profile
nm-applet &
disown "%nm-applet"
tmux
ssh-add
echo "Done"
