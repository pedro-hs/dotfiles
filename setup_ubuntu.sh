#!/usr/bin/env bash
source show_status.sh

print_message "INITIAL SETUP"
cat src/.bashrc | sed -e 1d >> ~/.bashrc
rm -f ~/.dir_colors
ln -sf $(pwd)/src/.dir_colors ~/.dir_colors
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
sudo apt purge --autoremove -y gedit

print_message "UPDATE"
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt update -y
sudo apt upgrade -y
sudo snap refresh

print_message "INSTALL LB-OFFICE,TERM-UTILS"
sudo apt install -y libreoffice-calc libreoffice-writer curl mlocate wget gcc make

print_message "INSTALL SNAPS: VSCODE,SOUND-SWITCHER"
sudo snap install --classic code
sudo snap install indicator-sound-switcher

print_message "INSTALL GIT"
sudo apt install -y git
rm -f ~/.gitconfig
ln -sf $(pwd)/src/.gitconfig ~/.gitconfig

print_message "INSTALL GS"
git clone https://github.com/pedro-hs/git-selection.git
cd git-selection
source install.bash
cd ..
rm -rf git-selection

print_message "INSTALL KITTY"
sudo apt install -y kitty
rm -rf ~/.config/kitty/*
ln -sf $(pwd)/src/.config/kitty ~/.config/kitty
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'kitty'"

print_message "INSTALL PIP,VIRTUALENV"
sudo apt install -y python3-pip python3-virtualenv

print_message "INSTALL CHROME"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'google-chrome --incognito'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Super>g'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'chrome'"

print_message "INSTALL LF"
echo 'deb http://download.opensuse.org/repositories/home:/Provessor/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:Provessor.list
curl -fsSL https://download.opensuse.org/repositories/home:Provessor/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_Provessor.gpg > /dev/null
sudo apt update
sudo apt install lf
rm -rf ~/.config/lf
ln -sf $(pwd)/src/.config/lf ~/.config/lf
rm -rf ~/.local/share/lf
ln -sf $(pwd)/src/.local/share/lf ~/.local/share/lf

print_message "INSTALL NEOVIM"
installation_dir="$(pwd)"
cd ~/.config
rm -rf nvim
git clone https://github.com/pedro-hs/nvim.git
cd nvim
sh install.sh && vi -c PlugInstall +qall
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/command "'kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty nvim'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Super>n'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/name "'neovim'"
cd "$installation_dir"

print_message "SETUP PREFERENCES"
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor 0
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.wm.preferences button-layout :close
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'kitty.desktop']"

print_message "CHANGE .DESKTOP"
sudo rm -rf /usr/share/applications/kitty.desktop
sudo rm -rf /usr/share/applications/nvim.desktop
sudo cp src/desktop/* /usr/share/applications

sudo updatedb
source ~/.bashrc

print_message "TODO"
echo 'Make vim after install'
echo 'Setup chrome bookmarks and adblock'

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
