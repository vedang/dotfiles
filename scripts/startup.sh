echo "Running startup commands"
sh ~/.bash_profile
nm-applet &
disown "%nm-applet"
ssh-add
tmux a
echo "Done"
