#!/bin/bash

# Coloring scheme for notfications and logo
ESC="\x1b["
RESET=$ESC"39;49;00m"
CYAN=$ESC"33;36m"
RED=$ESC"31;01m"
GREEN=$ESC"32;01m"

# Warning
function warning() 
{	echo -e "\n$RED [!] $1 $RESET\n"
	}

# Green notification
function notification() 
{	echo -e "\n$GREEN [+] $1 $RESET\n"
	}

# Cyan notification
function notification_b() 
{	echo -e "\n$CYAN [-] $1 $RESET\n"
	}

function get_gdriver() 
{	printf "\n\n"
	MACHINE_TYPE=`uname -m`
	if [[ ${MACHINE_TYPE} == 'x86_64' ]]; then
		notification "x86_64 architecture detected..."
		sleep 1

		wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
		tar -xvf geckodriver-v0.24.0-linux64.tar.gz
		rm geckodriver-v0.24.0-linux64.tar.gz
		chmod +x geckodriver
		mv geckodriver /usr/sbin
		sudo ln -s /usr/sbin/geckodriver /usr/bin/geckodriver

		notification "Geckodriver has been succesfully installed"
	else
		notification "x32 architecture detected..."
		sleep 1
		wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux32.tar.gz
		tar -xvf geckodriver-v0.24.0-linux32.tar.gz
		rm geckodriver-v0.24.0-linux32.tar.gz 
		chmod +x geckodriver 
		mv geckodriver /usr/sbin 
		sudo ln -s /usr/sbin/geckodriver /usr/bin/geckodriver
		notification "Geckodriver has been succesfully installed."
	fi
}


if [[ "$EUID" -ne 0 ]]; then
    warning "This script has to be run as root"
    exit 1
else
    clear && sleep 0.5
    notification_b "This script will install the Mozilla Geckodriver, which DorkNet depends on."
    printf "%bAfter this operation has been completed the script can also install"
    printf "%b\nthe dependencies from the requirements file if you'd prefer to.\n\n"
    
    read -p 'Install requirements file after Geckodriver setup? Y/n : ' choice
    if [[ $choice == 'y' || $choice == 'Y' ]]; then
        notification "Installing Geckodriver and requirements file." && sleep 2
        get_gdriver && sleep 2
        
        clear
        notification "Installing requirements file."
        
        sudo -H pip install -r requirements.txt
        
        notification "All operations completed."
        exit 0
      
        
    else
        notification "Installing Geckodriver." && sleep 2
        get_gdriver && sleep 2
        
        notification "All operations completed."
        exit 0
    fi 
fi	
