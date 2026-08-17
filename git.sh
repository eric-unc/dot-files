#!/usr/bin/env bash
set -euo pipefail

git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global user.email "ericts@vt.edu"
git config --global user.name "Eric Thomas Schneider"
git config --global init.defaultBranch main
git config --global fetch.prune true
git config --global merge.conflictstyle zdiff3
git config --global core.editor vim
git config --global push.autoSetupRemote true
git config --global rerere.enabled true
git config --global diff.algorithm histogram
