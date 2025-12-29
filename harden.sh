#!/bin/bash

# --- Linux Server Hardening Script ---
# This script automates basic security steps for a Debian/Ubuntu server.

echo "------------------------------------------"
echo "Starting System Hardening..."
echo "------------------------------------------"

# 1. Update the System
echo "[*] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Install and Configure Firewall (UFW)
echo "[*] Configuring UFW Firewall..."
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp   # SSH
sudo ufw allow 80/tcp   # HTTP
sudo ufw allow 443/tcp  # HTTPS
echo "y" | sudo ufw enable

# 3. Secure SSH (Disable Root Login)
echo "[*] Hardening SSH Configuration..."
# This replaces "PermitRootLogin yes" with "no" for better security
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "------------------------------------------"
echo "Hardening Complete! System is updated and secured."
echo "------------------------------------------"
