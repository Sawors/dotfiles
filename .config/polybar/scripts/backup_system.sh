notify-send "System Backup" "starting system backup"

if sudo timeshift --create
then 
	notify-send "System Backup" "backup successfully done"
else
	notify-send "System Backup" "backup failed"
	alacritty -T "floating-console" -e sudo timeshift --create
fi &
