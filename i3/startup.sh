#!/bin/zsh

# Workspace 1: Open a vim window with x-today.txt and x-learnings.txt in vsplit
i3-msg workspace 1: today/learnings
i3-msg append_layout ~/.i3/workspace-1.json
terminator --command "vim -O ~/x-today.txt ~/x-learnings.txt" -T "Today Notes/Learnings" &

# Workspace 2: Open a vim window with x-goals.txt on the left and my calendar spreadsheet on the right
i3-msg workspace 2: goals/calendar
i3-msg append_layout ~/.i3/workspace-2.json
terminator --command "vim ~/x-goals.txt" -T "Goals" &
gnumeric x-calendar.gnumeric &

# Workspace 10: Open chromium and point it to my Anki decks
i3-msg workspace 10: Anki
i3-msg append_layout ~/.i3/workspace-10.json
chromium --new-window --force-device-scale-factor=2 https://ankiweb.net/decks/ &
