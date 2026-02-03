#!/usr/bin/env bash
# This script install dotfiles

read -p ":: Proceed with installing dotfiles? [Y/n] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ -d "$HOME/.config" ]];; then
        read -p ":: Dotfiles found, back it up? [Y/n] " -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo ":: Copying dotfiles..."
            cp "$HOME/.config" "$HOME/.config_bak"
            echo ":: Backup complete under $HOME/.config_bak"
        else
            echo ":: Skipping dotfiles backup"
        fi
    fi

    echo ":: Installing dotfiles..."

    DOTFILES="$PWD/dotfiles"

    mkdir -p ~/.config
    rsync -a --delete "$DOTFILES/.config" $HOME/.config
    rsync -a --delete "$DOTFILES/.bash_aliases" "$HOME/.bash_aliases"
    rsync -a --delete "$DOTFILES/.vimrc" "$HOME/.vimrc"

    echo ":: Dotfiles successfully installed"
else
    echo ":: Skipping dotfile installation"
fi
