#!/bin/zsh

CONNECTED_DISPLAYS=$(xrandr | grep -v '^[ ]' | grep '^[a-zA-Z]*\-' | grep '\Wconnected' | awk '{ print $1 }')
CONNECTED_DISPLAY_COUNT=$(echo $CONNECTED_DISPLAYS | wc -l)
echo "$CONNECTED_DISPLAY_COUNT displays connected:"
echo "$CONNECTED_DISPLAYS"

# First disable all screens
xrandr | grep -v '^[ ]' | grep '^[a-zA-Z]*\-' | awk '{ print $1 }' | xargs bash -c 'for display; do xrandr --output "$display" --off; done' bash

if [ 4 -eq $CONNECTED_DISPLAY_COUNT ]; then
    # TODO: Verify that the four are eDP-1, DP-2-1, DP-2-2, and DP-1
    xrandr --output eDP-1 --off
    xrandr --output DP-1 --auto --output DP-2-1 --auto --output DP-2-2-8 --auto --primary # Turn on the extra screens
    xrandr --output DP-2-1 --rotate right --pos 2520x320 \
           --output DP-2-2-8 --rotate right --pos 1080x0 \
           --output DP-1 --rotate left --pos 0x320
elif [ 3 -eq $CONNECTED_DISPLAY_COUNT ]; then
    # TODO: Verify that the three are eDP-1, DP-2-1, and DP-2-2-8
    xrandr --output eDP-1 --off
    xrandr --output DP-2-1 --auto --output DP-2-2-8 --auto --primary # Turn on the extra screens
    xrandr --output DP-2-1 --rotate right --pos 1440x320 --output DP-2-2-8 --rotate right --pos 0x0
elif [ 2 -eq $CONNECTED_DISPLAY_COUNT ]; then
    xrandr --output eDP-1 --auto --pos 0x0 --primary
    xrandr --output $(echo $CONNECTED_DISPLAYS | tail -1) --auto --same-as eDP-1
else # leave this as an else so we fall back to leaving my primary monitor on
    xrandr --output eDP-1 --auto --pos 0x0 --primary # --output DP-2-1 --off --output DP-2-2 --off
fi
