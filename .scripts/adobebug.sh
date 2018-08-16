#!/bin/bash

# cp -p /usr/lib/Adobe/Reader9/Browser/intellinux/nppdf.so /usr/lib/Adobe/Reader9/Browser/intellinux/nppdf.so.orig
# /opt/Adobe/Reader9/Browser/intellinux/nppdf.so
# /usr/lib/firefox/plugins/nppdf.so
# /usr/lib/firefox-addons/plugins/nppdf.so
# /usr/lib/mozilla/plugins/nppdf.so

sudo sed -i 's/C:\\nppdf32Log\\debuglog.txt/\/dev\/null\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000/' /opt/Adobe/Reader9/Browser/intellinux/nppdf.so

for i in `locate nppdf.so`; do
  let count=count+1
  sudo sed -i 's/C:\\nppdf32Log\\debuglog.txt/\/dev\/null\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000\o000/' locate nppdf.so[${count}]
  fi
done

