#!/bin/bash

# Get list of Wi-Fi networks
networks=$(nmcli -f SSID,SIGNAL dev wifi list)

# Use wofi to select a network
selected=$(echo "$networks" | wofi --dmenu --prompt "Select Wi-Fi Network")

# Extract the SSID from the selected option
ssid=$(echo "$selected" | awk '{print $1}')

# Connect to the selected network
if [ -n "$ssid" ]; then
    # Prompt for password
    password=$(wofi --dmenu --prompt "Enter password for $ssid")

    # Connect to the network
    nmcli d wifi connect "$ssid" password "$password"
fi
