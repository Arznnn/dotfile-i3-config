#!/bin/sh
STRING="vegdata.dev"

echo "Please select ..."
  echo 1: Skip
  echo 2: Check package $STRING
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1) 	break
	    ;;
    2)	echo "Checking package."
	mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
	cd ~
	R CMD check ~/workspace/vegdata.dev/vegdata.dev
	mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
	break
	;;
  esac
done

  echo Should I build the package $STRING "?"
  echo 1: Skip
  echo 2: Build and install package $STRING
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
       1)  break
           ;;
       2)  echo I build and install the package $STRING
	  cd ~
	  R CMD build ~/workspace/vegdata.dev/vegdata.dev
	  R CMD INSTALL ~/workspace/vegdata.dev/vegdata.dev
	  echo Uploading ...
	  scp ~/vegdata.dev_*.tar.gz jansen7@141.53.8.94:/srv/geobot/web/download/r_package
	  break
          ;;
      *)  echo "invalid selection"
	  break
	  ;;
  esac
done
echo "That's all!"
