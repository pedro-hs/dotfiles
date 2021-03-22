#!/usr/bin/env bash
sudo snap install dbeaver-ce insomnia
sudo apt install -y awscli python3.6

mkdir ~/.config/autostart
cp work_autostart/* ~/.config/autostart/

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker "$(whoami)"
sudo chmod 666 /var/run/docker.sock

# TEAMS APP
# BITBUCKET SSH
