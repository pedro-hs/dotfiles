print_message "CLONE DOTFILES"
mkdir /home/$(whoami)/src
cd /home/$(whoami)/src
git clone git@github.com:pedro-hs/dotfiles.git
cd dotfiles
source setup_zorin.sh
