alias c='xclip -selection clipboard'
alias diff='diff --color'
alias g='git'
alias m='make'
alias p='python'
alias v='vim'

# Copy kitty's terminfo to the remote host on connect, so TERM=xterm-kitty is
# recognized there. Needs the local kitty binary, which a remote shell inheriting
# TERM=xterm-kitty won't have -- hence the command -v guard.
if [ "$TERM" = "xterm-kitty" ] && command -v kitty >/dev/null 2>&1; then
    alias ssh="kitty +kitten ssh"
fi

# Colored prompt whenever the terminal actually supports color. The stock
# .bashrc decides this by matching TERM against xterm-color|*-256color, which
# misses xterm-kitty and anything else not named that way; ask tput instead.
if command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
