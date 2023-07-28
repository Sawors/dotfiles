#!/bin/sh
# [DP-3] [DP-5] [DP-0]
#
# Xranr setup
xrandr --output DP-0 --primary --mode 3440x1440 --pos 3840x0 --rate 120 --output DP-1 --off --output HDMI-0 --off --output DP-2 --off --output DP-3 --mode 1920x1080 --pos 0x360 --rate 60 --output DP-4 --off --output DP-5 --mode 1920x1080 --pos 1920x360 --rate 60 --output USB-C-0 --off --output None-1-1 --off

# i3 Workspaces

# Polybar setup
polybar-msg cmd quit
MONITOR=DP-0 polybar main 1>&1 | tee -a /tmp/polybar1.log & disown
MONITOR=DP-3 polybar aux 1>&1 | tee -a /tmp/polybar1.log & disown
MONITOR=DP-5 polybar aux 1>&1 | tee -a /tmp/polybar1.log & disown

# Wallpapers
/home/sawors/.scripts/wallpaper.sh 0
/home/sawors/.scripts/wallpaper.sh 1
/home/sawors/.scripts/wallpaper.sh 2

# Power management settings
xset s off
xset dpms 0 0 0
