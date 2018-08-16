#!/bin/sh

# Gives a dmenu prompt to mount unmounted drives.
# If they're in /etc/fstab, they'll be mounted automatically.
# Otherwise, you'll be prompted to give a mountpoint from already existsing directories.
# If you input a novel directory, it will prompt you to create that directory.

pgrep -x dmenu && exit

mountable=$(lsblk -lp | grep part | grep -v "t /" | awk '{print $1, "(" $4 ")"}')
[[ "$mountable" = "" ]] && exit 1
chosen=$(echo "$mountable" | dmenu -i -p "Mount which drive?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1
sudo mount "$chosen" && exit 0
# You may want to change the line below for more suggestions for mounting.
# I.e. you can increase the depth of the search, or add directories.
# This will increase the load time briefly though.
dirs=$(find /mnt /media /mount /home -type d -maxdepth 5 1>/dev/null)
mountpoint=$(echo "$dirs" | dmenu -i -p "Type in mount point.")
[[ "$mountpoint" = "" ]] && exit 1
if [[ ! -d "$mountpoint" ]]; then
	mkdiryn=$(echo -e "No\nYes" | dmenu -i -p  "$mountpoint does not exist. Create it?")
	[[ "$mkdiryn" = Yes ]] && sudo mkdir -p "$mountpoint"
fi
sudo mount $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen mounted to $mountpoint."
