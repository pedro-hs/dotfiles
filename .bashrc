# /bin/cp /etc/skel/.bashrc ~/
alias python=python3.6
alias pip=pip3
alias cf=cfiles
alias bashrc="cd ~ && nvim .bashrc"
alias gconf="cd ~ && nvim .gitconfig"
alias evi="cd ~/.config/nvim && nvim src/config.vim src/maps.vim src/complements.vim src/plugins.vim"
alias penv="source env/bin/activate"
alias src="cd ~/Documents/src"
alias pm="python3 manage.py"
alias gg="git"

PS1='\w\[\033[32m\]$(__git_ps1)\n \$\[\033[0m\] '
export EDITOR="nvim"
