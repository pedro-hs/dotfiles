#!/usr/bin/env bash
source others/show_status.sh

print_message "INSTALL GIT"
sudo apt install -y git

print_message "CLONE DOTFILES"
mkdir /home/$(whoami)/src
cd /home/$(whoami)/src
git clone git@github.com:pedro-hs/dotfiles.git
cd dotfiles

print_message "START INSTALLATION"
source setup_zorin.sh
