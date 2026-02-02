#!/usr/bin/env bash
# This scritpt config git

echo ":: Configuring git and SSH key"

if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C ""
    echo ":: SSH public key: $(cat ~/.ssh/id_ed25519.pub)"
else
    echo ":: SSH key already exists"
fi

git config --global user.name "$(read -p "Enter your git username: ")"
git config --global user.email "$(read -p "Enter your git email: ")"
