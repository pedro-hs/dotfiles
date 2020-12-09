# /bin/cp /etc/skel/.bashrc ~/
alias python=python3.6
alias pip=pip3
alias rg=ranger
alias bashrc="cd ~ && nvim .bashrc"
alias gconf="cd ~ && nvim .gitconfig"
alias evi="cd ~/.config/nvim && nvim init.vim"
alias penv="source env/bin/activate"
alias src="cd ~/Documents/src"
alias gg="git"

PS1='\w\[\033[32m\]$(__git_ps1)\n \$\[\033[0m\] '
export EDITOR="nvim"
set -o vi

alias pvenv="source venv/bin/activate"
alias api="cd ~/Documents/src/b2b-api && nvim"
alias apit="cd ~/Documents/src/b2b-api && source exe.sh t"
alias apid="cd ~/Documents/src/b2b-api && source exe.sh d"
alias apis="cd ~/Documents/src/b2b-api && source exe.sh s"
alias admin="cd ~/Documents/src/b2b-admin-v2 && nvim"
alias sdk="cd ~/Documents/src/b2b-api-sdk && nvim"
alias notes="cd ~/Documents/Pedro/notes; terminator -e \"vi login_phs daily\""
