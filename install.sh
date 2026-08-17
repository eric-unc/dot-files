#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

cp .bash_aliases ~
cp .gdbinit ~
cp .tmux.conf ~
cp .vimrc ~
./git.sh
