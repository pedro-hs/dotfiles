#!/usr/bin/env bash
source show_status.sh

print_message "UPDATE BASHRC"
cat src/static/.bashrc | sed -e 1d >> ~/.bashrc

print_message "INIT KEYBINDINGS"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

print_message "REMOVE BLOATWARE"
sudo rm -rf /var/cache/snapd
sudo rm -rf /etc/gufw
sudo apt purge --autoremove -y snapd gedit aisleriot gnome-mahjongg gnome-maps brasero evolution gimp gnome-calendar cheese gnome-mines gnome-photos libreoffice-draw pitivi quadrapassel remmina rhythmbox gnome-sound-recorder gnome-sudoku gnome-todo gnome-tour gnome-weather zorin-connect gnome-contacts gufw totem

print_message "UPDATE"
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt update -y
sudo apt upgrade -y

print_message "INSTALL TERM-UTILS"
sudo apt install -y curl mlocate wget gcc make

print_message "INSTALL VSCODE"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

print_message "INSTALL INDICATOR SOUND SWITCHER"
sudo add-apt-repository ppa:yktooo/ppa
sudo apt-get update
sudo apt-get install -y indicator-sound-switcher

print_message "INSTALL KITTY"
sudo apt install -y kitty
rm -rf ~/.config/kitty/*
ln -sf $(pwd)/src/.config/kitty ~/.config/kitty
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'kitty'"

print_message "INSTALL PIP,VIRTUALENV"
sudo apt install -y python3-pip python3-virtualenv

print_message "SETUP PREFERENCES"
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.shell.extensions.zorin-taskbar panel-size 55
gsettings set org.gnome.shell.extensions.zorin-taskbar intellihide true
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,close
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.peripherals.keyboard delay 300
# dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'kitty.desktop']"

print_message "CHANGE .DESKTOP"
sudo rm -rf /usr/share/applications/kitty.desktop
sudo rm -rf /usr/share/applications/nvim.desktop
sudo cp src/static/desktop/* /usr/share/applications

print_message "INSTALL GIT"
sudo apt install -y git
rm -f ~/.gitconfig
ln -sf $(pwd)/src/static/.gitconfig ~/.gitconfig

print_message "CONFIGURE SSH KEY"
sudo -u $(whoami) bash -c "ssh-keygen -f ~/.ssh/id_rsa -N ''"
echo '-- SSH KEY --'
cat ~/.ssh/id_rsa.pub

print_message "CONCLUSION"
sudo updatedb
sudo apt clean
sudo apt autoclean
sudo apt autoremove
source ~/.bashrc
sudo sed -i -e 's/#WaylandEnable=false/WaylandEnable=true/g' /etc/gdm3/custom.conf

print_message "INSTALL DONE!"
echo '-- TODO --'
echo 'Create ssh  key'
echo 'Make vim after install'
echo 'Setup firefox bookmarks and adblock'
echo 'Open sound switcher'
