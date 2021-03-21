sudo apt purge --autoremove gedit
cat .bashrc | sed -e 1d >> ~/.bashrc
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y libreoffice-calc libreoffice-writer curl mlocate wget gcc make
sudo snap refresh
sudo snap install --classic code
sudo snap install indicator-sound-switcher

# GIT
sudo apt install -y git
rm -f ~/.gitconfig
cp .gitconfig ~/

# TERMINATOR
sudo apt install -y terminator
rm -rf ~/.config/terminator
mkdir ~/.config/terminator
cp config ~/.config/terminator

# CFILES
git clone https://github.com/mananapr/cfiles.git
cd cfiles
sudo apt install libncurses-dev libxext-dev python3-pip mediainfo atool
make
sudo make install
pip3 install ueberzug virtualenv
cd ..
rm -rf cfiles

# VIM
installation_dir=$(pwd)
cd ~/.config
sudo rm -rf nvim
git clone https://github.com/pedro-hs/nvim.git
cd nvim
sudo sh install.sh && vi -c PlugInstall +qall
rm -f DroidSansMono.zip
# cd ~/.config/nvim && vi --clean (run :PlugInstall)
cd $installation_dir

# TWEAKS
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
gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,close
gsettings set org.gnome.mutter center-new-windows true

# KEYBOARD
# wget https://github.com/jergusg/k380-function-keys-conf/archive/refs/tags/v1.1.zip
# # Connect keyboard
# unrar k380-function-keys-conf-1.1.zip
# cd k380-function-keys-conf-1.1
# make install
# sudo k380_conf -d /dev/hidrawX -f on
# cd ..
# rm -rf k380-function-keys-conf-1.1
# rm -f k380-function-keys-conf-1.1.zip

# TODO: Fix keyboard fn key
# TODO: pair bluetooth keyboard on startup
# TODO: Remove unecessary programs
