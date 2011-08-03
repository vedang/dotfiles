#!/bin/bash
# get id of terminal
win=$(xdotool search --onlyvisible --class gnome-terminal | head -1)

if [ "x$win" = x ]; then
    # start
    ~/incoming-src/dotfiles/scripts/compiz-send.py vpswitch switch_to_1_key
    gxmessage -center -timeout 2 -nofocus -buttons "" -borderless "loading Terminal..."&
    exec /usr/bin/gnome-terminal &
else
    if [ $win = $(xdotool getwindowfocus) ]; then
        # do nothing
        sleep 0.2;
    else
        # switch to it
        xdotool windowactivate $win
    fi
fi
