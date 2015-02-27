#!/bin/sh
# send weekly jukebox contents summary 

HOST=`/bin/hostname`
RCPTS="xxx@yyy.com"
SERVER="notornis "

LOG="/tmp/summary.$$"

/usr/openv/netbackup/bin/admincmd/bpmedialist -U -summary > $LOG 

if [ -s $LOG ];then
   cat ${LOG} | mailx -s "Weekly Netbackup Report" ${RCPTS}
fi


/bin/rm -f ${LOG}
