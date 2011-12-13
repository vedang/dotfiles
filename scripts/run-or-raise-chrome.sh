#!/bin/bash
# get id of chrome
win=$(xdotool search --onlyvisible --class chromium-browser | head -1)

if [ "x$win" = x ]; then
    # start
    ~/incoming-src/dotfiles/scripts/compiz-send.py vpswitch switch_to_2_key
    gxmessage -center -timeout 2 -nofocus -buttons "" -borderless "loading Chrome..."&
    exec /usr/bin/google-chrome &
else
    if [ $win = $(xdotool getwindowfocus) ]; then
        # send it C-t
        sleep 0.2; xdotool key --clearmodifiers --window $win Ctrl+t
    else
        # switch to it
        xdotool windowactivate $win
    fi
fi
