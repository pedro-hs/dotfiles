#!/usr/bin/env bash
source others/show_status.sh

print_message "CONFIGURE SSH KEY"
sudo -u $(whoami) bash -c "ssh-keygen -f ~/.ssh/id_rsa -N ''"
echo '-- SSH KEY --'
cat ~/.ssh/id_rsa.pub

print_message "DONE"
echo '-- TODO --'
echo 'Add ssh to github'
echo 'Run source install.sh'
