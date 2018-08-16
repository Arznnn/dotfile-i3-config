#!/bin/bash
export DISPLAY=:0.0 
if grep '/media/nfsBackup' /etc/mtab > /dev/null 2>&1 ; then 
	notify-send "Starting backup ..."
	obnam --config=.obnam.nfs force-lock
	obnam --config=.obnam.nfs forget --keep=72h,14d,10w,36m,10y
	obnam --config=.obnam.nfs backup
# Cronjob mit Verschlüsseln nicht möglich
	if [ "$?" -ne 0 ]; then
	  notify-send -t 10000 "Unable to finish obnam backup."
	  exit 1
	else
	  notify-send "Finished backup."
	fi
else 
  notify-send -t 1000 "Backup drive not available ..."
fi
### Mount backup
# mkdir ~/obnam
# obnam mount --repository /net/NAS/mnt/HD/HD_a2/backup --client-name jansen-UX31A --viewmode=multiple / --to=/home/jansen/obnam
# obnam mount  $ROOT --repository=$DIR --to=/mount --viewmode=multiple --log=$DIR/mount.log
# fusermount -u ~/obnam
# obnam forget --keep=72h,14d,10w,24m

