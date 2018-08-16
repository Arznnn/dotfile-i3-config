#!/bin/bash
# Define a timestamp function
year=`date +"%G"`
month=`date +"%m"`
day=`date +"%d"`
# full_path="http://foto-webcam-mv.de/webcam/greifswald/$year/$month/$day"

eval $(date +Y=%Y\;m=%m\;d=%d\;H=%H\;M=%M)
minutes="${M: -1}"
[[ "$M" < "10" ]] && M=00 # cater for octal clash
if [ $minutes -lt 4 ]
then
  echo "Picture ${H}$(((M/10)*10))_hu.jpg not available yet: $minutes"
  M=$((M-10))
else 
  echo "Everything is fine"
fi
M=$(((M/10)*10))
((M==0)) && M=00 # the math returns 0, so make it 00
picturename="${H}${M}_hu.jpg"

webcam_path="http://foto-webcam-mv.de/webcam/greifswald/$year/$month/$day/$picturename"
echo $webcam_path
cd
wget $webcam_path -O HGWRathaus.jpg
convert HGWRathaus.jpg -crop 200x150+1300+750 out.png
feh -Z -^ $picturename out.png &
