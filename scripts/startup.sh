echo "Running startup commands"
nm-applet &
disown "%nm-applet"
ssh-add
tmux
echo "Done"
