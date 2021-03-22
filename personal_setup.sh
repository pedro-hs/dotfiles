#!/usr/bin/env bash
source script_status.sh

print_message "INSTALL TRANSMISSION"
sudo apt install -y transmission

print_message "INSTALL STEAM"
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb && sudo apt install -y ./steam.deb

print_message "TODO"
echo 'Install netflix and evernote app and add to favorites'
echo 'Run steam-launcher'
echo 'Setup bitbucket ssh'
echo 'Login atlassian, gsuite, teams, etc...'

print_message "DONE"
