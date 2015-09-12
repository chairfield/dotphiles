#!/bin/zsh

# Load my layouts
i3-msg workspace 1
i3-msg append_layout ~/.i3/workspace-1.json
i3-msg workspace 2
i3-msg append_layout ~/.i3/workspace-2.json

# Start to programs to be swallowed
terminator --command "vim -O ~/x-today.txt ~/x-learnings.txt" &
gnumeric x-calendar.gnumeric &
terminator --command "vim ~/x-goals.txt" &
