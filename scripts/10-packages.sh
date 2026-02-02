#!/usr/bin/env bash
# This script install packages from packages/ folder

echo ":: updating using pacman"
sudo pacman -Syu --needed --nocomfirm

echo ":: installing package from pacman repository"
sudo pacman -S --needed --norcomfirm - < packages/pacman.txt

echo ":: installing package from Aur"

if ! command -v yay > /dev/null; then
    echo ":: yay not installed\n:: installing yay"

    sudo pacman -S --needed --nocomfirm base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay

    (cd /tmp/yay && makepkg -si --nocomfirm)
    echo ":: yay installed"
fi

yay -S --needed --nocomfirm - < packages/aur.txt

echo ":: packages installed successfully"
