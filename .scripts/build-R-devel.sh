#!/bin/sh

# This is the location of the source code
cd ~/workspace
svn co https://svn.r-project.org/R/trunk r-devel/R
cd r-devel/R

# R_PAPERSIZE=letter				\
# R_BATCHSAVE="--no-save --no-restore" 		\
# R_BROWSER=xdg-open				\
# PAGER=/usr/bin/pager				\
# PERL=/usr/bin/perl				\
# R_UNZIPCMD=/usr/bin/unzip			\
# R_ZIPCMD=/usr/bin/zip				\
# R_PRINTCMD=/usr/bin/lpr				\
# LIBnn=lib					\
# AWK=/usr/bin/awk                                \
# CC="ccache gcc"					\
# CFLAGS="-ggdb -pipe -std=gnu99 -Wall -pedantic -DTESTING_WRITE_BARRIER" \
# CXX="ccache g++"				\
# CXXFLAGS="-ggdb -std=c++0x -pipe -Wall -pedantic" \
# FC="ccache gfortran"				\
# FCFLAGS="-ggdb -pipe -Wall -pedantic"		\
# F77="ccache gfortran"				\
# FFLAGS="-ggdb -pipe -Wall -pedantic"		\
# MAKE="make -j4"					\
# ./configure 					\
#     --prefix=/usr/local/lib/R-devel 		\
#     --enable-R-shlib 				\
#     --enable-strict-barrier 			\
#     --with-blas 				\
#     --with-lapack 				\
#     --with-readline 				\
#     --without-recommended-packages

R_PAPERSIZE=A4				\
R_BATCHSAVE="--no-save --no-restore" 		\
R_BROWSER=xdg-open				\
PAGER=/usr/bin/pager				\
PERL=/usr/bin/perl				\
R_UNZIPCMD=/usr/bin/unzip			\
R_ZIPCMD=/usr/bin/zip				\
R_PRINTCMD=/usr/bin/lpr				\
LIBnn=lib					\
AWK=/usr/bin/awk                                \
# CC="gcc ccache"					\
#CFLAGS="-ggdb -pipe -std=gnu99 -Wall -pedantic" \
# CXX="g++ ccache"				\
# CXXFLAGS="-ggdb -pipe -Wall -pedantic" 		\
# FC="ccache gfortran"	 	  		\
# F77="ccache gfortran"				\
MAKE="make -j4"					\
./configure 					\
    --prefix=/usr/local/lib/R-devel 		\
    --enable-R-shlib 				\
    --with-blas 				\
    --with-lapack 				\
    --with-readline 				\
    --without-recommended-packages

#CC="clang -O3"                                  \
#CXX="clang++ -03"				\


#make svnonly
make

echo "*** Done -- now run 'sudo make install' in ~/workspace/r-devel/R"
echo '*** and install.packages(c("Matrix","cli","stringi","jsonlite","sp","rlang","vegan","labdsv","akima","gWidgets","googleVis","indicspecies","knitr","testthat","RSQLite",
"foreign","plyr", "survival", "XML", "boot", "codetools", "KernSmooth","rpart","class","nnet","spatial","vioplot", "partitions", "geometry","httr"))'
