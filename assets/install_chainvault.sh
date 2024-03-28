#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

function show_ascii_akkupy() {
    echo -e "

           _    _                      
     /\   | |  | |                     
    /  \  | | _| | ___   _ _ __  _   _ 
   / /\ \ | |/ / |/ / | | | '_ \| | | |
  / ____ \|   <|   <| |_| | |_) | |_| |
 /_/    \_\_|\_\_|\_\\__,_| .__/ \__, |
                          | |     __/ |
                          |_|    |___/ 

"
}

show_ascii_akkupy
check_internet

sudo apt update
sudo apt upgrade -y
sudo apt install git python3 python3-virtualenv
sudo mkdir /home/$USER/chainvault
git clone https://github.com/tenzopy/chainVaultBackend /home/$USER/chainvault/
virtualenv /home/$USER/chainvault/chainvaultBackend/venv
source /home/$USER/chainvault/chainvaultBackend/venv/bin/activate
pip install -r /home/$USER/chainvault/chainvaultBackend/requirements.txt


