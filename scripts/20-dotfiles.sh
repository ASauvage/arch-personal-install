#!/usr/bin/env bash
# This script install dotfiles

echo ":: Installing dotfiles..."

DOTFILES="$PWD/dotfiles"

mkdir -p ~/.config

rsync -a --delete "$DOTFILES/.config" ~/.config

echo ":: Dotfiles successfully installed"
