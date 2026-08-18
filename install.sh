#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

cp .bash_aliases ~
cp .gdbinit ~
cp .tmux.conf ~
cp .vimrc ~

mkdir -p ~/.config/kitty
cp .config/kitty/* ~/.config/kitty/

# kitty.app.png sets the X11 window icon, but GNOME's dash/app grid ignores
# that and looks up Icon=kitty in the icon theme instead. Shadow the packaged
# icon with per-size copies in the user theme, which takes precedence.
icons=~/.local/share/icons/hicolor
for size in 16 24 32 48 64 128 256 512; do
  mkdir -p "$icons/${size}x${size}/apps"
  if command -v magick >/dev/null; then
    magick .config/kitty/kitty.app.png -resize "${size}x${size}" "$icons/${size}x${size}/apps/kitty.png"
  elif command -v convert >/dev/null; then
    convert .config/kitty/kitty.app.png -resize "${size}x${size}" "$icons/${size}x${size}/apps/kitty.png"
  else
    cp .config/kitty/kitty.app.png "$icons/${size}x${size}/apps/kitty.png"
  fi
done
if command -v gtk-update-icon-cache >/dev/null; then
  gtk-update-icon-cache -f -t "$icons"
fi

./git.sh
