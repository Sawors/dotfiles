
desktop="main"


source=$HOME/.scripts/desktops/${desktop}.yml

found=false

for file in /home/sawors/.scripts/desktops/*.yml; do
    [ -e "$file" ] || continue
	
	filename=$(echo "$file" | cut -d"/" -f 6 | cut -d"." -f 1)
	
	fetched=$(neofetch --stdout --off cpu gpu memory resolution)
	
	resolution=$(neofetch --stdout --off resolution)
	detected_monitors=$(($(grep -o "," <<< "${resolution}" | wc -l) + 1))
	
	cpu=$(yq ".cpu" "$file")
	gpu=$(yq ".gpu" "$file")
	ram=$(yq ".ram" "$file")
	monitor=$(yq ".monitors" "$file")
	launch=$(yq ".launch-script" "$file")


	
	if [ $monitor -eq $detected_monitors ] && grep -q "${cpu}" <<< ${fetched} && grep -q "${gpu}" <<< ${fetched} &&  grep -q "${ram}" <<< ${fetched}; 
	then
		${launch}
		notify-send "Config "\"${filename}\"" applied"
		found=true
	fi
done

if ! [[ $found ]];
then
	$HOME/.scripts/wallpaper.sh 0
	$HOME/.config/polybar/launch.sh
fi
