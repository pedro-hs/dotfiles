#!/usr/bin/env bash
source others/show_status.sh

print_message "INSTALL TRANSMISSION, VLC"
sudo apt install -y transmission vlc

print_message "INSTALL STEAM"
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb && sudo apt install -y ./steam.deb

print_message "TODO"
echo 'Install netflix and evernote app and add to bookmarks'
echo 'Run steam-launcher'

print_message "DONE"
