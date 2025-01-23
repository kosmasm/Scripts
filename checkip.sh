#!/bin/bash

# Function to validate IP address
function validate_ip() {
    local ip=$1
    local stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

# Function to validate suffix
function validate_suffix() {
    local suffix=$1
    local stat=1

    if [[ $suffix =~ ^[0-9]{1,2}$ && $suffix -le 32 ]]; then
        stat=0
    fi
    return $stat
}

# Main script
read -p "Enter IP address (with optional suffix): " ip_address

ip=$(echo $ip_address | cut -d'/' -f1)
suffix=$(echo $ip_address | cut -d'/' -f2)

if validate_ip $ip; then
    echo "IP address is valid."
else
    echo "IP address is not valid."
fi

if [[ $ip_address == *"/"* ]]; then
    if validate_suffix $suffix; then
        echo "Suffix is valid."
    else
        echo "Suffix is not valid."
    fi
fi

if [[ $ip_address == *"/"* ]]; then
    ipcalc_output=$(ipcalc -n $ip_address)
    network_address=$(echo $ipcalc_output | grep -oP 'Network:\s+\K[^\s]+')
    if [[ $network_address == $ip/$suffix ]]; then
        echo "IP address is in the correct subnet."
    else
        echo "IP address is not in the correct subnet."
    fi
fi
