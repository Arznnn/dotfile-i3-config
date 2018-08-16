#!/bin/bash

yes()
{
	echo Building package
	echo
}

no()
{
	echo Skip building package
	exit	
}

R CMD check ~/R/indicspecies

echo Should I build the package?
select choice in yes no ;do
	$choice
	break
done

R CMD build ~/R/indicspecies
R  CMD INSTALL ~/R/indicspecies
cd ~/R/i486-pc-linux-gnu-library/2.11/
zip -r indicspecies.zip indicspecies/*

cat indicspecies.zip | ssh jansen7@141.53.8.94 \
	"cat > /srv/geobot/web/download/r_package/indicspecies.zip"
cd ~
