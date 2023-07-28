#!/bin/sh
# Battery charge limit
if sudo systemctl start asusd
then
	notify-send "Asus battery limit" "daemon successfuly started"
else 
	notify-send "Asus battery limit" "daemon didn't start: sudo couldn't be done"
fi &
# [eDP] [HDMI-A-0]
#
# Xranr setup
xrandr --output eDP --mode 1920x1080 --pos 0x820 --output HDMI-A-0 --primary --mode 3840x2160 --pos 1920x0 --output HDMI-A-1 --off &
# Xdpi setup
xrdb /home/sawors/.scripts/desktops/.Xhidpiconfig
# Polybar setup
polybar-msg cmd quit
MONITOR=HDMI-A-0 polybar main-hidpi 1>&1 | tee -a /tmp/polybar1.log & disown
MONITOR=eDP polybar aux 1>&1 | tee -a /tmp/polybar1.log & disown

# Wallpapers
/home/sawors/.scripts/wallpaper.sh 0
/home/sawors/.scripts/wallpaper.sh 1

# Power management settings
xset s off
xset dpms 0 7200 0


