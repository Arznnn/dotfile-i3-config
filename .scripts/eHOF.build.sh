#!/bin/sh
STRING="eHOF"

echo "Please select ..."
  echo 1: Skip
  echo 2: Check package $STRING 
  echo 3: Check package $STRING without vignette
  echo 4: Checking eHOF tarball as CRAN
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1) 	break
        ;;
    2)	echo "Checking package source ..."
	mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
        cd ~/workspace/eHOF 
	R-devel CMD check ~/workspace/eHOF/eHOF
	mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
	break
	;;
    3) 	echo "Checking package without vignette ..."
	R-devel CMD check --no-vignettes ~/workspace/eHOF/eHOF
	break
	;;
    4)  echo "Checking package tarball as-cran"
	cd ~/workspace/eHOF
	mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
	R-devel CMD check --as-cran ~/eHOF*.tar.gz
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
	echo Uploading
#	  scp ~/vegdata_*.tar.gz jansen7@141.53.8.94:/srv/geobot/web/download/r_package
	  R-devel CMD build ~/workspace/eHOF/eHOF
	  R CMD INSTALL ~/workspace/eHOF/eHOF
#	  cd ~/R/i686-pc-linux-gnu-library/3.1/
#	  cat ~/eHOF_*.tar.gz | ssh jansen7@141.53.8.94 \
#		  "cat > /srv/geobot/web/download/r_package/eHOF.tar.gz"
#	  cd ~
          break
          ;;
      *)  echo "invalid selection"
	  break
	  ;;
  esac
done
echo "\n That's all! \n"
