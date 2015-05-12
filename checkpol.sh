#!/bin/bash

NBROOT=/usr/openv/netbackup

SOURCEDIR="/path/to/fullsize/images"


$NBROOT/bin/admincmd/bppllist -allpolicies -L > /tmp/foo.$$ 

for i in $SOURCEDIR
do
   cat /net/$i/vol/vol0/etc/exports       | 
      awk '{print $1}'                    | 
          while read export
          do
             if egrep -i $export /tmp/foo.$$ > /dev/null
             then
		:   # do nuthin.  nuthin at all.
             else
                echo "$i:$export" 
             fi 
          done
done


/bin/rm -f /tmp/foo.$$ 
