#!/usr/bin/env bash
source show_status.sh

print_message "INSTALL GIT"
sudo apt install -y git
rm -f ~/.gitconfig
ln -sf $(pwd)/src/static/.gitconfig ~/.gitconfig

print_message "CONFIGURE SSH KEY"
sudo -u $(whoami) bash -c "ssh-keygen -f ~/.ssh/id_rsa -N ''"
echo '-- SSH KEY --'
cat ~/.ssh/id_rsa.pub

print_message "CONFIGURE WAYLAND"
sudo sed -i -e 's/#WaylandEnable=false/WaylandEnable=true/g' /etc/gdm3/custom.conf
sudo sed -i -e 's/DRIVER/# DRIVER/g' /usr/lib/udev/rules.d/61-gdm.rules

print_message "DONE"
echo '-- TODO --'
echo 'Change layout'
echo 'Set dark theme'
echo 'Add ssh to github'
echo 'run `sudo systemctl restart gdm3`'
echo 'Select Wayland'
echo 'Run source setup_zorin.sh'
