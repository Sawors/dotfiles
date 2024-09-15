#!/bin/bash

# see man zscroll for documentation of the following parameters

length=25

if (( $1 > 0 ));
then
	length=$1
fi

zscroll -l $length \
        --delay 0.5 \
        --scroll-padding "  " \
        --match-command "`dirname $0`/get_spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "`dirname $0`/get_spotify_status.sh" &

wait
