#!/bin/sh
                          
for file in $(grep -il "HLR" *)
do
sed -e "s/HLR/HOF/ig" $file > /tmp/tempfile.tmp
mv /tmp/tempfile.tmp $file
done
