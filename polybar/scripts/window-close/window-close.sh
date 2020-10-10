#!/bin/bash
while true; do
    ACTIVE_WINDOW_ID=`echo $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)`

    if [ "$ACTIVE_WINDOW_ID" = "0x0" ]; then
        echo ""
    else # Can be configured to output differently when player is paused
        echo " X"
    fi
    sleep 0.2
done