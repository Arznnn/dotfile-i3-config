#!/bin/sh
STRING="vegdata"

  echo "Please select ..."
  echo 1: Build package $STRING and check tarball with R-devel --as-cran
  echo 2: Build package $STRING with R stable --no-build-vignettes
  echo 3: Skip
  echo 4: Check package $STRING with R stable
  echo 5: Check package $STRING without vignette with R stable
  echo 6: Check vegdata tarball as cran with R devel
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1)  cd ~
        mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
	rm ~/vegdata_*.tar.gz
        R-devel CMD build ~/workspace/vegdata/vegdata --compact-vignettes=gs
# R-devel CMD build ~/workspace/vegdata/vegdata --no-build-vignettes
	cd ~/workspace/vegdata
        R-devel CMD check --as-cran ~/vegdata_*.tar.gz
        mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
        break
        ;;
    2)  cd ~
        mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
        rm ~/vegdata_*.tar.gz
        R CMD build ~/workspace/vegdata/vegdata --no-build-vignettes
        mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin 
	break
        ;;
    3)  break
        ;;
    4)	echo "Checking package."
	mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
	cd ~
	R CMD build ~/workspace/vegdata/vegdata --no-build-vignettes
	cd ~/workspace/vegdata
	R CMD check ~/vegdata*.tar.gz
	mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
	break
	;;
    5)  echo "Checking package without vignette."
	cd ~/workspace/vegdata
	mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
        R CMD check --no-vignettes vegdata
	mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
	break
	;;
    6)  echo "Checking package tarball as-cran"
	cd ~/workspace/vegdata
	mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
	R-devel CMD check --as-cran ~/vegdata_*.tar.gz
	mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
	break
	;;
	*) echo Invalid selection
  esac
done

  echo Should I build the package $rSTRING "? (R-devel)"
  echo 1: Skip
  echo 2: Install package $STRING 
  echo 3: Check package tarball $STRING "as cran "
  echo 4: Check package tarball $STRING with stable version "--without-vignettes"
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1) break
	   ;;
    2)  echo I will install the package $STRING for R stable and R devel
	cd ~
	R-devel CMD INSTALL ~/vegdata_*.tar.gz
	R CMD INSTALL ~/vegdata_*.tar.gz
	cd ~
	break
	;;  
    3)  echo "Checking package as cran ..."
        mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
        cd ~/workspace/vegdata
        R-devel CMD check --as-cran ~/vegdata_0.*.tar.gz
        mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
        break
        ;;
    4)  echo "Checking package as cran ..."
        mv ~/.wine/drive_c/Turbowin ~/.wine/drive_c/Turbowon
        R CMD check --no-vignettes ~/vegdata_0.*.tar.gz
        mv ~/.wine/drive_c/Turbowon ~/.wine/drive_c/Turbowin
	break
	;;
     *) echo invalid selection
	break
	;;
  esac
done
echo "That's all!"

