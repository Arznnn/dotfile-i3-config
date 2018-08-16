#! /bin/bash

function check {
     if [ $? -ne 0 ] ; then
         xmessage -center "Error occurred getting URL $1:" -display :0.0
         if [ $? -eq 6 ]; then
             echo "Unable to resolve host"
         else
             echo "Unable to connect to host"
	 fi
         exit 1
     fi
}
curl -sS -o "/dev/null" $1
check $1;

# MSSG="/tmp/mssg-file-${RANDOM}" 
#    echo -e " MESSAGE \n ==========\n Done with task, YEY. " > ${MSSG}
#    xmessage -center -file ${MSSG} -display :0.0 
#    [[ -s ${MSSG} ]] && rm -f ${MSSG}

# notify-send "$(~/shellscripts/availabilitytestserver.sh http://rl2020.bgbm.org)"

