#!/usr/bin/env bash
# This script install packages from packages/ folder

echo ":: Updating using pacman..."
sudo pacman -Syu --needed --nocomfirm

echo ":: Installing package from pacman repository..."
sudo pacman -S --needed --norcomfirm - < packages/pacman.txt

echo ":: Installing package from Aur..."

if ! command -v yay > /dev/null; then
    echo ":: Yay not installed\n:: Installing yay..."

    sudo pacman -S --needed --nocomfirm base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay

    (cd /tmp/yay && makepkg -si --nocomfirm)
    echo ":: Yay installed"
fi

yay -S --needed --nocomfirm - < packages/aur.txt

echo ":: All packages successfully installed"
