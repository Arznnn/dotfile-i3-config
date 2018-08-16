#!/bin/sh
Netz="BGBM"
Backup="RoteListen"

echo "Please select ..."
  echo 1: $STRING Netzlaufwerke verbinden
  echo 2: $Backup synchronisieren
  echo 3: $STRING Netzlaufwerke trennen
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1)	echo "Verbinde Netzlaufwerke ..."
	# mounting and synchronising Server shares if arriving at BGBM
	sudo mount -t cifs -o username=f.jansen,uid=1000,password=f.jansen2012 //130.133.70.29/f.jansen$ /mnt/RL_Privat
	sudo mount -t cifs -o username=f.jansen,uid=1000,password=f.jansen2012 //130.133.70.29/Gruppen /mnt/RL_Gruppen
	sudo mount -t cifs -o username=f.jansen,uid=1000,password=f.jansen2012 //130.133.70.29/ALLG /mnt/RL_Allg
#	sudo mount -t cifs -o username=f.jansen,uid=1000,password=f.jansen2012 //130.133.70.48/redlist/standardliste /mnt/pesiimport
	break;;
    2) echo 
	unison BGBM-Privat &
	# unison BGBM-ALLG 
	unison BGBM-RoteListen
	break
	;;
    3) echo "Netzlaufwerke trennen ..."
	sudo umount /mnt/RL_Allg/
	sudo umount /mnt/RL_Gruppen/
	sudo umount /mnt/RL_Privat/
#	sudo umount /mnt/pesiimport/
	break
	;;
  esac
done
echo 'Good Bye.'

