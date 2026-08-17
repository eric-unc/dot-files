#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

cp .bash_aliases ~
cp .gdbinit ~
cp .tmux.conf ~
cp .vimrc ~

mkdir -p ~/.config/kitty
cp .config/kitty/kitty.conf .config/kitty/current-theme.conf ~/.config/kitty/
./git.sh
