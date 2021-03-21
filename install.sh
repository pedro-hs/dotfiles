set -e
# INSTALL
message="updating/n"
apt update -y
apt upgrade -y
clear
echo -en "$message"

message+="installing libre office calc/n"
apt install -y libreoffice-calc
clear
echo -en "$message"

message+="installing libre office writer/n"
apt install -y libreoffice-writer
clear
echo -en "$message"

message+="installing gnome-tweaks/n"
apt install -y gnome-tweaks
clear
echo -en "$message"

message+="installing terminator/n"
apt install -y terminator
clear
echo -en "$message"

message+="installing ranger/n"
apt install -y ranger
clear
echo -en "$message"

message+="installing vlc/n"
snap install vlc
clear
echo -en "$message"

message+="installing sound indicator/n"
snap install vlc indicator-sound-switcher
clear
echo -en "$message"

message+="installing vscode/n"
snap install --classic code
clear
echo -en "$message"

# CONFIGURE PROGRAMS
message+="setting git"
rm ~/.gitconfig
cp .gitconfig ~/
clear
echo -en "$message"

message+="setting terminator"
rm -rf ~/.config/terminator
mkdir ~/.config/terminator
cp config ~/.config/terminator
clear
echo -en "$message"

message+="updating bashrc"
cat .bashrc | sed -e 1d >> ~/.bashrc
clear
echo -en "$message"


# CONFIGURE VIM
message="setting vim"
installation_dir=$(pwd)
cd ~/.config
git clone https://github.com/pedro-hs/nvim.git
cd nvim
sh install.sh
cd $installation_dir
clear
echo -en "$message"


# CONFIGURE SO
message="setting so preferences"
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
clear
echo -en "$message"

# FIX
message="fixing keyboard"
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
clear
echo -en "$message"

# TODO: pair bluetooth keyboard on startup
# TODO: configure ranger? vimfm? cfiles?
# TODO: Remove unecessary programs
