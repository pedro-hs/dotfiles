# /bin/cp /etc/skel/.bashrc ~/

# bash
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
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
alias f="lfcd"

# kitty
export TERM="xterm-256color"
export TERMINAL="kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty"

# dragon
dragonzord() {
    (sleep 1 && WIN_ID="$(wmctrl -l | awk '/dragon/ {print $1}')" && wmctrl -i -r "$WIN_ID" -b add,above) &
    dragon "$@"
}
alias dr="dragonzord"
alias dra="dragozord -x -a"

# maps man
kittyman() {
    less <<EOF
    # tab
    ctrl shit t - create
    ctrl shift q - close
    ctrl shift left right - navigate tabs
    ctrl shift alt t - rename tab

    # terminal
    ctrl shift up down - scroll
    ctrl shift home end - go to home/end

    # windows
    ctrl j k l h - navigate
    ctrl shift enter - create
    ctrl shift w - close
    ctrl shift l - change layout
    ctrl shift f - move windows

    # others
    ctrl shift f5 - reload kitty.conf
EOF
}

emacsman() {
    less <<EOF
    ctrl a       I
    ctrl e       A
    ctrl k       D
    alt  d       de
    ctrl u       d0
    ctrl w       db
    ctrl /       ggVG
    ctrl f       l
    ctrl b       h
    alt  f       w
    alt  b       b
    ctrl l       clear
    ctrl d       delete
EOF
}
