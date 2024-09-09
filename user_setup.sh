#!/bin/bash

# Add user "Olav" with no password initially
sudo adduser --quiet --disabled-password --gecos "" olav

# Set the password for user "Olav" to "olav"
echo "olav:olav" | sudo chpasswd

# Change terminal hostname
sudo hostnamectl set-hostname Olav

# Check if the network configuration file exists as a .yml and rename it to .yaml if needed
if [ -f /etc/netplan/*.yml ]; then
    sudo mv /etc/netplan/*.yml /etc/netplan/01-netcfg.yaml
    echo "Renamed .yml to .yaml"
fi

# Create or overwrite the network configuration with a static IP
sudo bash -c 'cat << EOF > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.52/24
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF'

# Apply the new netplan configuration
sudo netplan apply

# Create necessary folders for Olav
sudo mkdir -p /home/olav/Documents/Regnskap /home/olav/Documents/IT /home/olav/Documents/Kontor
sudo mkdir /home/olav/.private_docs

# Set permissions for folder access
sudo groupadd regnskap
sudo groupadd it
sudo groupadd kontor

# Assign appropriate users to the groups (modify usernames as needed)
sudo usermod -aG regnskap olav
sudo usermod -aG it ituser
sudo usermod -aG kontor kontoruser

# Create shared folder for document sharing
sudo mkdir /home/olav/shared
sudo chown olav:regnskap /home/olav/shared
sudo chmod 770 /home/olav/shared
sudo setfacl -m g:it:r /home/olav/shared
sudo setfacl -m g:kontor:r /home/olav/shared
