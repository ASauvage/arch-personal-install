#!/usr/bin/env bash
# This script mount disks using fstab (WIP)

echo ":: Fetching disks...\n:: disks available"

echo $(lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep disk | awk '{print $1, "\t", $2}')
disks=$(lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep disk | awk '{print $1}')

for i in $disks; do
    if gum confirm ":: Proceed to mount disk $i?"; then
        echo ":: Mounting disk $i"
        sudo mkdir /mnt/$i
        echo "UUID=XXXXXX-XXXX-XXXX /mnt/$i btrfs defaults 0 2" | sudo tee -a /etc/fstab
    else
        echo ":: Skipping disk $i mount"
    fi
done

sudo mount -a
echo ":: Disks configuration complete"
