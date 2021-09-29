print_message "PREPARE DOTFILES"
cd ~/src
rm -rf dotfiles
git clone git@github.com:pedro-hs/dotfiles.git

print_message "INSTALL GS"
git clone https://github.com/pedro-hs/git-selection.git
cd git-selection
source install.bash
cd ..
rm -rf git-selection

print_message "INSTALL NEOVIM"
installation_dir="$(pwd)"
cd ~/.config
rm -rf nvim
git clone git@github.com:pedro-hs/nvim.git
cd nvim
sh install.sh && vi -c PlugInstall +qall
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/command "'kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty nvim'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Super>n'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/name "'neovim'"
cd "$installation_dir"
