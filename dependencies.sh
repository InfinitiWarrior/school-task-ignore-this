#!/bin/bash

# Update package list and install necessary packages
sudo apt update && sudo apt upgrade -y

# Install gnumeric and texstudio
sudo apt install -y gnumeric texstudio flatpak

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up

# Install a flatpak password manager (e.g., Bitwarden)
sudo flatpak install flathub com.bitwarden.desktop -y
