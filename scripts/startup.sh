echo "Running startup commands"
sh ~/.bash_profile
sh ~/.bashrc
nm-applet &
disown "%nm-applet"
tmux
ssh-add
echo "Done"
