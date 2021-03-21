# INSTALL
apt update -y
apt upgrade -y
apt install -y libreoffice-calc libreoffice-writer gnome-tweaks terminator ranger
snap install vlc indicator-sound-switcher
snap install --classic code

# CONFIGURE PROGRAMS
rm ~/.gitconfig
cp .gitconfig ~/
rm -rf ~/.config/terminator
mkdir ~/.config/terminator
cp config ~/.config/terminator
cat .bashrc | sed -e 1d >> ~/.bashrc

# CONFIGURE VIM
installation_dir=$(pwd)
cd ~/.config
git clone https://github.com/pedro-hs/nvim.git
cd nvim
sh install.sh
cd $installation_dir

# CONFIGURE SO
ubuntu-drivers autoinstall
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface gtk-key-theme='Emacs'
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30

# FIX
apt install gcc make
wget https://github.com/jergusg/k380-function-keys-conf/archive/refs/tags/v1.1.zip
# Connect keyboard
unrar k380-function-keys-conf-1.1.zip
cd k380-function-keys-conf-1.1
make install
sudo k380_conf -d /dev/hidrawX -f on
cd ..
rm -rf k380-function-keys-conf-1.1
rm k380-function-keys-conf-1.1.zip

# TODO: pair bluetooth keyboard on startup
# TODO: configure ranger? vimfm? cfiles?
# TODO: Remove unecessary programs
