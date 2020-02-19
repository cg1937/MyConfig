#!/bin/bash
# this script refer to virtual machine
# it is successful on Ubuntu 18.04LTS and Kali Linux

PROFILE_FILE=/etc/profile
SCREEN_CURRENT_NAME=$(echo $(xrandr) | grep -E -o 'Virtual[0-9]' | head -1)

FULL_MODE_INFO=$(cvt 3840 2160)
MODE_INFO=${FULL_MODE_INFO#*Modeline }

xrandr --newmode  ${MODE_INFO}
xrandr --addmode ${SCREEN_CURRENT_NAME} "3840x2160_60.00"

cat << EOF | tee -a ${PROFILE_FILE}
xrandr --newmode  ${MODE_INFO}
xrandr --addmode ${SCREEN_CURRENT_NAME} "3840x2160_60.00"
EOF

while true
do
	read -r -p "4k mode profile is finished, make sure to reboot the system now[Y/n]: " input
	case $input in
	    [yY][eE][sS]|[yY])
			shutdown -r now
			;;

	    [nN][oO]|[nN])
			exit	       	
			;;

	    *)
			echo "Invalid input."
			;;
	esac
done
