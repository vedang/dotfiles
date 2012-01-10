#!/bin/bash
# get id of emacs
win=$(xdotool search --onlyvisible --class emacs | head -1)

if [ "x$win" = x ]; then
    # start
    ~/incoming-src/dotfiles/scripts/compiz-send.py vpswitch switch_to_1_key
    gxmessage -center -timeout 2 -nofocus -buttons "" -borderless "loading emacs..."&
    exec /usr/bin/emacs-snapshot &
else
    if [ $win = $(xdotool getwindowfocus) ]; then
        # do nothing
        sleep 0.2;
    else
        # switch to it
        xdotool windowactivate $win
    fi
fi
