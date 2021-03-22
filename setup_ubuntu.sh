#!/usr/bin/env bash
cat .bashrc | sed -e 1d >> ~/.bashrc
cat temp_bashrc >> ~/.bashrc  # TEMP
source script_status.sh
sudo apt purge --autoremove -y gedit

print_message "UPDATE"
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt update -y
sudo apt upgrade -y
sudo snap refresh

print_message "INSTALL LB-OFFICE AND TERM UTILS"
sudo apt install -y libreoffice-calc libreoffice-writer curl mlocate wget gcc make

print_message "INSTALL VSCODE AND SOUND SWITCHER"
sudo snap install --classic code
sudo snap install indicator-sound-switcher

print_message "INSTALL AND SETUP GIT"
sudo apt install -y git
rm -f ~/.gitconfig
cp .gitconfig ~/

print_message "INSTALL AND SETUP TERMINATOR"
sudo apt install -y terminator
rm -rf ~/.config/terminator
mkdir ~/.config/terminator
cp config ~/.config/terminator

print_message "INSTALL PIP AND VIRTUALENV"
sudo apt install -y python3-pip python3-virtualenv

print_message "INSTALL CHROME"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

print_message "INSTALL AND SETUP CFILES"
sudo rm -rf /home/$(whoami)/.local/share/Trash
mkdir "/home/$(whoami)/.local/share/Trash"
mkdir "/home/$(whoami)/.local/share/Trash/files"
sudo apt install -y libncurses-dev libxext-dev mediainfo atool fzf xdg-utils poppler-utils
pip3 install ueberzug
git clone https://github.com/mananapr/cfiles.git
rm -f cfiles/config.h
cp cfiles_conf/config.h cfiles
cd cfiles
make
sudo make install
cd ..
rm -rf cfiles
rm -rf ~/.config/cfiles/scripts
mkdir ~/.config/cfiles/scripts
cp cfiles_conf/scripts/* ~/.config/cfiles/scripts
rm -f ~/.config/cfiles/bookmarks
cp cfiles_conf/bookmarks ~/.config/cfiles/bookmarks

print_message "INSTALL AND SETUP NEOVIM"
installation_dir="$(pwd)"
cd ~/.config
sudo rm -rf nvim
git clone https://github.com/pedro-hs/nvim.git
cd nvim
sudo sh install.sh && vi -c PlugInstall +qall
cd "$installation_dir"

print_message "SETUP PREFERENCES"
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface gtk-key-theme Emacs
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor 0
gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,close
gsettings set org.gnome.mutter center-new-windows true
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'terminator.desktop']"
sudo updatedb

print_message "TODO"
echo 'Make vim after install'
echo 'Setup chrome bookmarks'

print_message "DONE"

# KEYBOARD FN TODO
# wget https://github.com/jergusg/k380-function-keys-conf/archive/refs/tags/v1.1.zip
# # Connect keyboard
# unrar k380-function-keys-conf-1.1.zip
# cd k380-function-keys-conf-1.1
# make install
# sudo k380_conf -d /dev/hidrawX -f on
# cd ..
# rm -rf k380-function-keys-conf-1.1
# rm -f k380-function-keys-conf-1.1.zip
