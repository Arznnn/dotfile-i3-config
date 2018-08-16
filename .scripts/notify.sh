#!/bin/bash
 
MSSG="/tmp/mssg-file-${RANDOM}" 
    echo -e " MESSAGE \n ==========\n Done with task, YEY. " > ${MSSG}
    xmessage -center -file ${MSSG} -display :0.0 
    [[ -s ${MSSG} ]] && rm -f ${MSSG}
