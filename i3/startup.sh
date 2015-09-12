#!/bin/zsh

# Load my layouts
i3-msg workspace 1: today/learnings
i3-msg append_layout ~/.i3/workspace-1.json
i3-msg workspace 2: goals/calendar
i3-msg append_layout ~/.i3/workspace-2.json
i3-msg workspace 10: Anki
i3-msg append_layout ~/.i3/workspace-10.json

# Start to programs to be swallowed
terminator --command "vim -O ~/x-today.txt ~/x-learnings.txt" &
gnumeric x-calendar.gnumeric &
chromium --new-window --force-device-scale-factor=2 https://ankiweb.net/decks/ &
terminator --command "vim ~/x-goals.txt" &
