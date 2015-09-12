#!/bin/zsh

# Workspace 1: Open a vim window with x-today.txt and x-learnings.txt in vsplit
i3-msg workspace 1: today/goals
i3-msg append_layout ~/.i3/workspace-1.json
terminator --command "vim -O ~/x-today.txt ~/x-goals.txt" -T "To Do" &

# Workspace 2: Open a vim window with x-goals.txt on the left and my calendar spreadsheet on the right
i3-msg workspace 2: learnings/calendar
i3-msg append_layout ~/.i3/workspace-2.json
terminator --command "vim ~/x-learnings.txt" -T "Learnings" &
gnumeric x-calendar.gnumeric &

# Workspace 10: Open chromium and point it to my Anki decks
i3-msg workspace 10: Anki
i3-msg append_layout ~/.i3/workspace-10.json
anki &

# End on Workspace 3
i3-msg workspace 3
