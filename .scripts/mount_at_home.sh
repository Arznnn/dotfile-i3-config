#!/usr/bin/env bash
# call with `mount.sh true` for debug messages

home_vols=( "/Volumes/NFS_mount" ) # if more than one mountpoint then order is important
home_router_mac="0:23:46:9d:e:f7" # use code below to identify this data
mounts=( `mount | grep /Volumes | awk {'print$3'}` )

router_ip=`netstat -rnf inet | grep default | awk {'print$2'}`
router_mac=`netstat -rnf inet | grep -v link | grep -w ^$router_ip | awk {'print$2'}`
#echo $router_mac #for current router's MAC address

#test for any parameter, true if debugging
test -n "$1" && dbg=$1 || dbg=false #;dbg=true
  
function debug {
  [ $dbg == true ] && echo $1 
}

function on_error {
  echo "errno $1"
  echo "rmdir $vol"
  rmdir $vol
  isMounted=false
}

function un_mount {
  for mount in ${mounts[@]}; do
    for vol in ${home_vols[@]}; do
      [ $mount == $vol ] && mount | grep nfs | grep $mount | awk {'print$3'} | xargs -t umount -f
    done
  done
  exit $?
}

function mount_disk {
  echo "trying to mount $vol as $1"
  mkdir $vol
  ### fix the following line to mount your nfs volume
  mount_nfs [-o options] server:/path $vol
  ###
  test $? != 0 && on_error $?
}

# if nothing mounted need $vols not empty to try when at home
[ -z $mounts ] && mounts=( "zero_mounts" )

debug "Running $0"
debug "volumes: `ls /Volumes*`"
debug "mounted volumes: `echo ${mounts[@]}`"

if [ "$router_mac" == "" ]; then
  debug "not connected"
  un_mount
fi
if ! [ "$router_mac" == $home_router_mac ]; then 
  debug "not at home"
  un_mount
fi
if [ $router_mac == $home_router_mac ]; then
  debug "at home"
  for mount in ${mounts[@]}; do
    for vol in ${home_vols[@]}; do
      if [ ! $mount == $vol ] && [ ! -d $vol ]; then
        mount_disk
      fi
    done
  done
fi

debug "isMounted: "$isMounted
debug "volumes: `ls /Volumes*`"
debug "mounted volumes: `mount | grep /Volumes | awk {'print$3'}`"