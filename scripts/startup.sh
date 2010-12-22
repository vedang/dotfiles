echo "Running startup commands"
sh ~/.bash_profile
sh ~/.bashrc
nm-applet &
disown "%nm-applet"
ssh-add
tmux
echo "Done"
