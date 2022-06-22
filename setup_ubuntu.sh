#!/usr/bin/env bash
source others/show_status.sh

print_message "SETUP BASHRC, GITCONFIG"
cat src/static/.bashrc | sed -e 1d >> ~/.bashrc
rm -f ~/.gitconfig
ln -sf $(pwd)/src/static/.gitconfig ~/.gitconfig

print_message "INIT KEYBINDINGS"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

print_message "REMOVE BLOATWARE"
sudo apt purge --autoremove -y gedit gnome-characters eog

print_message "UPDATE"
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt update -y
sudo apt upgrade -y

print_message "INSTALL UTILS"
sudo apt install -y curl mlocate wget gcc make gnome-shell-extension-impatience gnome-shell-extension-bluetooth-quick-connect drawing gnome-shell-extension-prefs shotwell vlc --no-install-recommends

print_message "INSTALL PIP,VIRTUALENV"
sudo apt install -y python3-pip python3-virtualenv

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
sudo rm -rf /usr/share/applications/kitty.desktop
sudo rm -rf /usr/share/applications/nvim.desktop
sudo cp src/static/desktop/* /usr/share/applications

print_message "INSTALL NEOVIM"
installation_dir="$(pwd)"
cd ~/.config
rm -rf nvim
git clone git@github.com:pedro-hs/nvim.git
cd nvim
sh install.sh && vi -c PlugInstall +qall
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty nvim'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Super>n'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'neovim'"
cd "$installation_dir"

print_message "INSTALL VSCODE"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

print_message "INSTALL INDICATOR SOUND SWITCHER"
sudo add-apt-repository -y ppa:yktooo/ppa
sudo apt update
sudo apt install -y indicator-sound-switcher

print_message "INSTALL FIREFOX"
sudo apt install firefox -y
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/command "'firefox --private-window'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Super>g'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/name "'firefox'"

print_message "INSTALL DOCKER"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker "$(whoami)"
sudo chown $(whoami):$(whoami) /var/run/docker.sock
rm -f get-docker.sh
sudo apt install -y docker-compose

print_message "SETUP PREFERENCES"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,close
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor 0
gsettings set org.gnome.mutter center-new-windows true
gnome-extensions disable ding@rastersoft.com
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'kitty.desktop']"

print_message "CONCLUSION"
sudo updatedb
sudo apt clean
sudo apt autoclean
sudo apt autoremove
source ~/.bashrc

print_message "INSTALL DONE!"
echo '-- TODO --'
echo 'Make vim after install'
echo 'Setup bookmarks and adblock'
echo 'Configure extensions (impatient)'
echo 'Organize icons in dock and grid'
