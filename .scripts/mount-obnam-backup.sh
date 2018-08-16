#!/bin/bash
# 
# script to mount all historical obnam repository data
# inside of the obnam repository directory.
#
# Syntax:
#     obnam-mount [path/to/obnam-repo [/base/path]]
#     obnam-mount -u [path/to/obnam-repo]
#
# create a symlink: obnam-umount -> obnam-mount
#     obnam-umount   [path/to/obnam-repo]
#
# path/to/obnam-repo : default "." ; where the obnam backup exists
# /base/path         : default "/" ; skip this path when mounting
# -u                 : unmount existing history
#                      ("obnam-mount -u" is the same as obnam-umount)
#
# Public domain: 2013-12-09 Osamu Aoki
#

if [ "${0##*/}" = "obnam-mount" ]; then
  if [ "$1" = "-u" ]; then
    MODE="umount"
    shift
  else
    MODE="mount"
  fi
elif [ "${0##*/}" = "obnam-umount" ]; then
  MODE="umount"
else
  echo "Error: wrong program name \"${0##*/}\"" >&2
  exit 1
fi 

# DIR=${1:-.}
# ROOT=${2:-/}
DIR=${1:-/media/jansen/BackupFlorian}
ROOT=${2:-/home/jansen/obnam}

if ! dpkg -l python-fuse >/dev/null ; then
  echo "Error: package \"python-fuse\" is missing.  Please install." >&2
  exit 1
fi

if [ ! -f $DIR/chunklist/metadata  -o ! -f $DIR/chunksums/metadata -o \
     ! -f $DIR/clientlist/metadata  -o ! -f $DIR/metadata/format -o \
     ! -d $DIR/chunks ]; then
  echo "Error: Path \"$DIR\" is not a obnam repository." >&2
  echo >&2
  echo "Usage syntax:">&2
  echo "        obnam-mount  [-u] [path/to/obnam-repo [/base/path]]" >&2
  echo "        obnam-umount  [path/to/obnam-repo]" >&2
  echo >&2
  echo "path/to/obnam-repo : default \".\" ; where the obnam backup exists" >&2
  echo "/base/path         : default \"/\" ; skip this path when mounting" >&2
  echo "-u                 : unmount existing history" >&2
  echo "                     (\"obnam-mount -u\" is the same as obnam-umount)" >&2
  exit 1
fi

echo "... found the obnam backup repository at: \"$DIR\"" >&2
echo >&2

if [ "$MODE" = "mount" ]; then
  if [ -d $DIR/mount -a -f $DIR/mount/.pid ]; then
    echo "... updating the history data at: \"$DIR/mount\"" >&2
    kill -HUP `cat $DIR/mount/.pid`
    echo >&2
  else
    mkdir -p $DIR/mount
    echo "... creating the history data at: \"$DIR/mount\"" >&2
    echo >&2
  fi
  obnam mount  $ROOT --repository=$DIR --to=$DIR/mount \
                 --viewmode=multiple --log=$DIR/mount.log
  echo "ls -lt $DIR/mount"
  ls -lt $DIR/mount
else
  if [ -d $DIR/mount -a -f $DIR/mount/.pid ]; then
    echo "... removing the history data at: \"$DIR/mount\"" >&2
    kill -HUP `cat $DIR/mount/.pid`
    echo >&2
  else
    echo "... found no history data at: \"$DIR/mount\"" >&2
    echo >&2
  fi
fi

