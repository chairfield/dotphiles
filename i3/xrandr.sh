#!/bin/zsh

CONNECTED_DISPLAYS=$(xrandr | grep -v '^[ ]' | grep '^[a-zA-Z]*\-' | grep '\Wconnected' | awk '{ print $1 }')
CONNECTED_DISPLAY_COUNT=$(echo $CONNECTED_DISPLAYS | wc -l)
echo "$CONNECTED_DISPLAY_COUNT displays connected:"
echo "$CONNECTED_DISPLAYS"

# First disable all screens
xrandr | grep -v '^[ ]' | grep '^[a-zA-Z]*\-' | awk '{ print $1 }' | xargs bash -c 'for display; do xrandr --output "$display" --off; done' bash

if [ 3 -eq $CONNECTED_DISPLAY_COUNT ]; then
    # TODO: Verify that the three are eDP-1, DP-2-1, and DP-2-2
    xrandr --output eDP-1 --auto --primary # Turn on the main screen as primary
    xrandr --output DP-2-1 --auto --output DP-2-2 --auto # Turn on the extra screens
    xrandr --output eDP-1 --pos 0x840 # I think turning it on as the only monitor automatically sets -pos to 0x0, so I do it after turning on the other guys
    xrandr --output DP-2-1 --rotate right --pos 3000x0 --output DP-2-2 --rotate left --pos 1920x0
elif [ 2 -eq $CONNECTED_DISPLAY_COUNT ]; then
    xrandr --output eDP-1 --auto --pos 0x0 --primary
    xrandr --output $(echo $CONNECTED_DISPLAYS | tail -1) --auto --same-as eDP-1
else # leave this as an else so we fall back to leaving my primary monitor on
    xrandr --output eDP-1 --auto --pos 0x0 --primary # --output DP-2-1 --off --output DP-2-2 --off
fi
