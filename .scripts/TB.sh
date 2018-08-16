#!/bin/sh

# Settings
SRCMAIN=~/Documents/
SRCDIR=$SRCMAIN/comm-1.9.1
SRCFILE=$SRCMAIN/thunderbird*.source.tar.bz2
DESTINATION=/opt/thunderbird
USERAPPDIR=.thunderbird

# CPU specific tuning, CPUCOUNT = (CPU Cores) + 1
CPUCOUNT=3
OPTIMIZE="-O3 -march=core2 -mtune=core2 -pipe -fomit-frame-pointer"

# Compiler-specific
CC=gcc
CXX=g++
CPP=cpp
LC_ALL=C
CFLAGS="-g -O3"
CXXFLAGS="-g O3"
CPPFLAGS=""
LDFLAGS="-Wl,-Bsymbolic-functions"

# Mozilla-specific
MOZILLA_OFFICIAL=1
BUILD_OFFICIAL=1

# Dependencies
apt-get --purge -q -y install debhelper autoconf2.13 autotools-dev quilt mozilla-devscripts patchutils cdbs libx11-dev libxt-dev libgtk2.0-dev libglib2.0-dev libstartup-notification0-dev zlib1g-dev libbz2-dev liborbit2-dev libidl-dev zip libxft-dev libfreetype6-dev libpng12-dev libjpeg62-dev libxrender-dev libxinerama-dev libcairo2-dev libpixman-1-dev libgnome2-dev libgconf2-dev libgnomevfs2-dev libgnomeui-dev libhal-dev libasound2-dev sharutils m4 libreadline5-dev libkrb5-dev libhunspell-dev libnspr4-dev libnss3-dev docbook-to-man
apt-get -q -y build-dep thunderbird

# Extract Source
cd $SRCMAIN
rm -rf $SRCDIR
mkdir -p $SRCDIR
cd $SRCDIR
echo -n "Extracting build source..." && tar --strip-components=1 -xjf $SRCFILE && echo "Ok."

# Apply patches (must be stored in the same directory as the source package)
#for i in $( ls -1 $SRCMAIN/*.patch ); do
#  echo ""
#  echo "Applying patch: $i"
#  patch -p1 < $i
#done

# Configure
echo ""
./configure --build=x86_64-linux-gnu \
            --prefix="$DESTINATION" \
            --includedir="/usr/include" \
            --mandir="/usr/share/man" \
            --infodir="/usr/share/info" \
            --libexecdir="/usr/lib/thunderbird" \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --srcdir=. \
            --with-user-appdir="$USERAPPDIR" \
            --with-system-jpeg=/usr \
            --with-system-zlib=/usr \
            --with-system-nspr \
            --with-system-nss \
            --with-distribution-id=com.ubuntu \
            --enable-application=mail \
            --enable-optimize="$OPTIMIZE" \
            --enable-extensions=default \
            --enable-official-branding \
            --enable-64bit \
            --enable-static \
            --enable-static-mail \
            --enable-system-cairo \
            --enable-system-hunspell \
            --enable-xinerama \
            --enable-canvas \
            --enable-pango \
            --enable-startup-notification \
            --disable-debug \
            --disable-debug-modules \
            --disable-debugger-info-modules \
            --disable-dependency-tracking \
            --disable-installer \
            --disable-install-strip \
            --disable-profilesharing \
            --disable-strip \
            --disable-strip-libs \
            --disable-elf-dynstr-gc \
            --disable-updater \
            --disable-xprint \
            --disable-ldap \
            --disable-logging \
            --disable-javaxpcom \
            --disable-crashreporter \
            --disable-mochitest \
            --disable-tests \
            --disable-maintainer-mode \
            --disable-ipv6 && \

make -j $CPUCOUNT && \
rm -rf $DESTINATION && mkdir -p $DESTINATION && \
make install && \

echo "" && echo "Fertig."
