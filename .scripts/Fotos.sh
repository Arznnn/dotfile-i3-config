#!/bin/sh
Netz="Burgstrasse"
Backup="Fotos"

echo "Please select ..."
  echo 1: $STRING Netzlaufwerke verbinden
  echo 2: $Backup synchronisieren
  echo 3: $STRING Netzlaufwerke trennen
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1)	echo "Verbinde Netzlaufwerke ..."
	# mounting and synchronising Server shares with NFS
	sudo mount 192.168.178.36:/mnt/Media /media/ServerMedia
	break;;
    2) echo 
	unison Fotos &
	break
	;;
    3) echo "Netzlaufwerke trennen ..."
	sudo umount /mnt/Bilder
	break
	;;
  esac
done
echo 'Good Bye.'

