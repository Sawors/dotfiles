#!/bin/sh
# Battery charge limit
if sudo systemctl start asusd
then
	notify-send "Asus battery limit" "daemon successfuly started"
else 
	notify-send "Asus battery limit" "daemon didn't start: sudo couldn't be done"
fi &
# Xranr setup
xrandr --output eDP --mode 1920x1080 --primary &

# Polybar setup
polybar-msg cmd quit
MONITOR=eDP polybar main 1>&1 | tee -a /tmp/polybar1.log & disown
# Wallpapers
/home/sawors/.scripts/wallpaper.sh 0
# Power management settings
xset s off
xset dpms 0 7200 0
