#!/bin/zsh

if [ 3 -eq $(xrandr | grep '\Wconnected' | awk '{ print $1 }' | wc -l) ]; then
    #xrandr --output eDP-1 --off --output DP-2-1 --auto --rotate left --pos 1920x0 --output DP-2-2 --auto --pos 0x420

    # Turn on the extra screens
    xrandr --output DP-2-1 --auto --output DP-2-2 --auto

    xrandr --output eDP-1 --auto --pos 0x840
    xrandr --output DP-2-1 --rotate right --pos 3000x0 --output DP-2-2 --rotate left --pos 1920x0 --primary
else
    xrandr --output eDP-1 --auto --pos 0x0 --primary --output DP-2-1 --off --output DP-2-2 --off
fi
