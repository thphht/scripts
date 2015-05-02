#!/bin/bash
# simple script to grep through craigslist site


INPAGE=`cat CLADS`
TMP1=tmp1
TMP2=tmp2
PATTERNS="xxx"
OUTPAGE=${PATTERNS}.txt
FROM="xxx@somewher.com"
TO="xxxx@gmail.com"

\rm -f $TMP1

for pagename in "$INPAGE"
   do

      wget $pagename -O $TMP1
      egrep -i -f $PATTERNS $TMP1 > $TMP2

   #   if [ ! -s "$TMP2" ]
   #   then
   #      rm -f $TMP2
   #      exit 1
   #   fi

      if [ -s "$OUTPAGE" ] 
      then 
         sed -e :a -e 's/<[^>]*>//g;/</N;//ba' $TMP2 > $OUTPAGE
         cat $OUTPAGE | mailx -s $FROM $TO
         exit 0
      fi

   done
