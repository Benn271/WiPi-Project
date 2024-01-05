#!/bin/bash

#Clear screen
clear


#Art
figlet WiPi Cracker
echo ""


#Check if root
usr=$(whoami)
if [[ $usr != root ]]; then
        echo "Run as root"
        echo "Command: sudo ./run.sh"
        exit 1
fi


#Wireless network choice
ip a
echo "input the wireless network interface from the list above (eg. wlan0, wlan1, wlan2, wlan3, etc.):"
read wireless_interface

echo "$wireless_interface"



exit 0
