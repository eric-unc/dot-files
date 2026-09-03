alias c='xclip -selection clipboard'
alias diff='diff --color'
alias g='git'
alias m='make'
alias p='python'
alias v='vim'

if [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitty +kitten ssh"
fi
