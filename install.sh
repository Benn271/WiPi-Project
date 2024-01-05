#!/bin/bash

#Check if user is root

usr=$(whoami)
if [[ $usr != root ]]; then
        echo "Must be root to run"
        echo "Command: sudo ./install.sh"
        exit 1
fi


#Install tools

echo "Installing nessarry tools"
sleep 1
echo "This might take a while"
echo ""
sudo apt-get install aircrack-ng -y
sudo apt-get install hcxdumptool -y
sudo apt-get install hashcat -y
sudo apt-get install figlet -y


#Run start.sh
chmod +x run.sh
sudo ./run.sh
exit 0
