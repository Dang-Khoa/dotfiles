#!/usr/bin/env bash

#genmon script for displaying the active window title on the panel

WINDOW_TITLE=$(xdotool getactivewindow getwindowname) 
MAX_LENGTH=30

INFO+=$(echo ${WINDOW_TITLE:0:${MAX_LENGTH}})
if [ ${#WINDOW_TITLE} -gt ${MAX_LENGTH} ]; then
    INFO+=...
fi
echo -e ${INFO}

MORE_INFO=<tool>
MORE_INFO+=${NULL_VALUE}  #to hide the tooltip
MORE_INFO+=</tool>

echo -e ${MORE_INFO}
