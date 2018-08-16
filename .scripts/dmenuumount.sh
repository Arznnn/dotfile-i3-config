
#!/bin/sh

# A dmenu prompt to unmount drives.
# Provides you with mounted partitions, select one to unmount.

# Drives mounted at /, /boot and /home will not be options to unmount.
# This can be changed by modifying $exclusionregex.

exclusionregex="\(/boot\|/home\|/\)$"
drives=$(lsblk -lp | grep "t /" | grep -v "$exclusionregex" | awk '{print $1, "(" $4 ")", "on", $7}')
[[ "$drives" = "" ]] && exit
chosen=$(echo "$drives" | dmenu -i -p "Unmount which drive?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit
sudo umount $chosen && pgrep -x dunst && notify-send "$chosen unmounted."
