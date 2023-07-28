read -p "what is the name of this desktop ? " configname
echo -n "fetching data..."
fetched=$(neofetch --stdout --off cpu gpu memory resolution)
echo " ✓"

cpu=$(echo ${fetched} | cut -d":" -f 2 | sed -r 's/( gpu)//g' | sed -r 's/ //')
gpu=$(echo ${fetched} | cut -d":" -f 3 | sed -r 's/( memory)//g' | sed -r 's/ //')
memory=$(echo ${fetched} | cut -d":" -f 4 | cut -d"/" -f 2 | sed -r 's/( resolution)//g' | sed -r 's/ //')
resolution=$(neofetch --stdout --off resolution)
detected_monitors=$(($(grep -o "," <<< "${resolution}" | wc -l) + 1))
launchscript=$HOME/.scripts/desktops/launch/${configname}.sh

configfile=$HOME/.scripts/desktops/${configname}.yml

echo "saving config to file..."
echo "# config for desktop \"${configname}\"" > "${configfile}"
echo "cpu: \"${cpu}\"" >> "${configfile}"
echo "gpu: \"${gpu}\"" >> "${configfile}"
echo "ram: \"${memory}\"" >> "${configfile}"
echo "monitors: ${detected_monitors}" >> "${configfile}"
echo "launch-script: \"${launchscript}\"" >> "${configfile}"
echo " ✓ config saved to ${configfile}"

echo "creating startup script..."
echo "# Put your startup config for this desktop (${configname}) here." >> $launchscript
chmod +x $launchscript
echo " ✓ startup script created at ${launchscript}"
echo "config successfuly generated !"
