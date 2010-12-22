echo "Running startup commands"
sh ~/.bash_profile
nm-applet &
disown "%nm-applet"
ssh-add
tmux
echo "Done"
