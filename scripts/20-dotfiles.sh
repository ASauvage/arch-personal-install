#!/usr/bin/env bash
# This script install dotfiles

echo ":: installing dotfiles"

DOTFILES="$PWD/dotfiles"

mkdir -p ~/.config

rsync -a --delete "$DOTFILES/.config" ~/.config

echo ":: dotfiles installed successfully"
