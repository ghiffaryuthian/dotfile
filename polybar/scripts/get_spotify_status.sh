#!/bin/bash

if [ "$(playerctl --player=spotify,playerctld status)" = "Stopped" ]; then
    echo "No music is playing"
elif [ "$(playerctl --player=spotify,playerctld status)" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 2 >/dev/null
    playerctl --player=playerctld --player=spotify,playerctld metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 1 >/dev/null
    playerctl --player=playerctld --player=spotify,playerctld metadata --format "{{ title }} - {{ artist }}"
fi