#!/bin/bash

# File path to store the counter
prev_ws_file="$HOME/.config/scripts/.prev_ws"

current_ws=$(wmctrl -d | awk '/\*/{print $1}')

# Check if the counter file exists, if not, initialize it
if [ ! -f "$prev_ws_file" ]; then
    echo 3 > "$prev_ws_file"
fi

# Read the current counter value
prev_ws=$(cat "$prev_ws_file")
echo "$prev_ws"

# Toggle between workspace 4 and the original workspace
if [ "$current_ws" -eq 3 ]; then
    wmctrl -s "$prev_ws"
else
    wmctrl -s 3
    
fi

# Save the current workspace
echo "$current_ws" > "$prev_ws_file"

