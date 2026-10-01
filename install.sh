#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

cp .bash_aliases ~
cp .gdbinit ~
cp .tmux.conf ~
cp .vimrc ~

mkdir -p ~/.config/kitty
cp .config/kitty/* ~/.config/kitty/

# kitty.app.png sets the X11 window icon, but GNOME (especially on Wayland)
# ignores that and looks up Icon=kitty from kitty.desktop. Dropping PNGs into
# ~/.local/share/icons/hicolor doesn't win: the package ships a scalable SVG in
# hicolor, and GTK prefers scalable icons over fixed sizes. So override the
# desktop entry with one pointing straight at our PNG.
mkdir -p ~/.local/share/applications
sed "s|^Icon=.*|Icon=$HOME/.config/kitty/kitty.app.png|" \
  /usr/share/applications/kitty.desktop > ~/.local/share/applications/kitty.desktop
if command -v update-desktop-database >/dev/null; then
  update-desktop-database ~/.local/share/applications
fi

./git.sh
