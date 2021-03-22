#!/usr/bin/env bash
source script_status.sh

print_message "INSTALL DBEAVER INSOMNIA"
sudo snap install dbeaver-ce insomnia

print_message "INSTALL AWSCLI"
sudo apt install -y awscli

print_message "INSTALL PYTHON3.6"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt install python3.6

print_message "SETUP AUTOSTART"
rm -rf ~/.config/autostart
mkdir ~/.config/autostart
cp work_autostart/* ~/.config/autostart/

print_message "INSTALL AND SETUP DOCKER"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker "$(whoami)"
sudo chmod 666 /var/run/docker.sock
rm -f get-docker.sh

print_message "SETUP PREFERENCES"
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'terminator.desktop', 'code_code.desktop', 'insomnia_insomnia.desktop', 'dbeaver-ce_dbeaver-ce.desktop']"
sudo updatedb

print_message "TODO"
echo 'Install teams app and add to favorites'
echo 'Setup databases in dbeaver'
echo 'Impost configs in insomnia'
echo 'Run $ aws configure'
echo 'Setup bitbucket ssh'
echo 'Login atlassian, gsuite, teams, etc...'

print_message "DONE"

# TODO: Script to auto clone and configure projects
# TODO: Script to semi-auto setup bitbucket ssh
# TODO: Move work configs to bitbucket and add alias python=python3.6
