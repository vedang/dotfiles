cat ~/.ssh/$1.pub |ssh $2 'sh -c "cat - >>~/.ssh/authorized_keys2"'
