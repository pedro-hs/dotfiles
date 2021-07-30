# /bin/cp /etc/skel/.bashrc ~/
# bash
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
alias vbsh="cd ~ && nvim .bashrc"
alias sbsh="cd ~ && source .bashrc"
alias xp="xclip -sel clip"
PS1='\w\[\033[32m\]$(__git_ps1)\n \$\[\033[0m\] '
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
bind '"\C-d"':kill-line

# git
alias g="git"
alias gconf="cd ~ && nvim .gitconfig"

# python
alias pip=pip3
alias pm="python3 manage.py"
alias penv="source env/bin/activate"

# vim
alias evi="cd ~/.config/nvim && nvim src/config.vim src/maps.vim src/complements.vim src/plugins.vim"
export EDITOR="nvim"
alias src="cd ~/Documents/src"

# lf
source ~/.config/lf/lfcd.sh
alias f="lfcd"

# kitty
export TERM="xterm-256color"
export TERMINAL="kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty"
